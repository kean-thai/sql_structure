CREATE TABLE [user] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [username] nvarchar(255) UNIQUE NOT NULL,
  [password] nvarchar(255),
  [phone_number] integer NOT NULL,
  [mail] nvarchar(255) UNIQUE NOT NULL,
  [status] nvarchar(255) DEFAULT 'ACTIVE',
  [user_type] nvarchar(255) DEFAULT 'USER'
)
GO

CREATE TABLE [group] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) UNIQUE NOT NULL,
  [address] nvarchar(255),
  [mail] nvarchar(255),
  [phone_number] nvarchar(255),
  [logo] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [user_group] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [user_id] integer NOT NULL,
  [group_id] integer NOT NULL
)
GO

CREATE TABLE [post_category] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255) UNIQUE NOT NULL,
  [description] nvarchar(255)
)
GO

CREATE TABLE [post] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [post_category_id] integer,
  [caption] text,
  [custom_layout] nvarchar(255) NOT NULL DEFAULT 'CLASSIC',
  [created_at] datetime NOT NULL DEFAULT (GETDATE()),
  [created_by] integer NOT NULL
)
GO

CREATE TABLE [post_media] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [post_id] integer NOT NULL,
  [caption] text,
  [size] integer NOT NULL,
  [mime_type] nvarchar(255) NOT NULL,
  [file_name] nvarchar(255) NOT NULL,
  [created_at] datetime NOT NULL DEFAULT (GETDATE())
)
GO

CREATE TABLE [post_group_visiblity] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [post_id] integer NOT NULL,
  [group_id] integer NOT NULL
)
GO

CREATE INDEX [idx_users_status] ON [user] ("status")
GO

CREATE UNIQUE INDEX [uk_user_group] ON [user_group] ("user_id", "group_id")
GO

CREATE UNIQUE INDEX [uk_post_group_visiblity] ON [post_group_visiblity] ("post_id", "group_id")
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for the user login information',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique name for login to system',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'username';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'password for login to system',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'password';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'employee mobile number',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'phone_number';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'employee persoanl mail address',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'mail';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '
      ACTIVE= for active user
      RESIGNED= for resigned user
    ',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'status';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '
      ADMIN= for full manage user
      USER= for normal user 
    ',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user',
@level2type = N'Column', @level2name = 'user_type';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for define group of employee',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'group name',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'group address',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'address';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'group mail address',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'mail';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'group mobile number',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'phone_number';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'group image url',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'group',
@level2type = N'Column', @level2name = 'logo';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for define user in groups that have privillage to see the post',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user_group';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user_group',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key user id',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user_group',
@level2type = N'Column', @level2name = 'user_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key group id',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'user_group',
@level2type = N'Column', @level2name = 'group_id';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for clasify post category type base on posting',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_category';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_category',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'post category name to clasify posting type',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_category',
@level2type = N'Column', @level2name = 'name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'additional note for user',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_category',
@level2type = N'Column', @level2name = 'description';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for post content or history by group that content info like photos, videos',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key post category to define posting type',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'post_category_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'posting catpion',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'caption';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = '
      CLASSIC = clasic display for media
      COLUMN = column display for media
      BANNER = banner display for media
      FRAME = Frame display for media
    ',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'custom_layout';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'store current datetime',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'store current user login id',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post',
@level2type = N'Column', @level2name = 'created_by';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for store post media like image, video, doc etc',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key post table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'post_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'catpion base on media',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'caption';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'media file size',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'size';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'media mime type example image/bmp, image/jpeg',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'mime_type';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'file url name',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'file_name';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'store current datetime',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_media',
@level2type = N'Column', @level2name = 'created_at';
GO

EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = 'Use for visiblity to group to see the posting',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_group_visiblity';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'unique primary key for table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_group_visiblity',
@level2type = N'Column', @level2name = 'id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key post table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_group_visiblity',
@level2type = N'Column', @level2name = 'post_id';
GO

EXEC sp_addextendedproperty
@name = N'Column_Description',
@value = 'foreign key group table',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'post_group_visiblity',
@level2type = N'Column', @level2name = 'group_id';
GO

ALTER TABLE [user_group] ADD FOREIGN KEY ([user_id]) REFERENCES [user] ([id])
GO

ALTER TABLE [user_group] ADD FOREIGN KEY ([group_id]) REFERENCES [group] ([id])
GO

ALTER TABLE [post] ADD FOREIGN KEY ([post_category_id]) REFERENCES [post_category] ([id])
GO

ALTER TABLE [post] ADD FOREIGN KEY ([created_by]) REFERENCES [user] ([id])
GO

ALTER TABLE [post_media] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([id])
GO

ALTER TABLE [post_group_visiblity] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([id])
GO

ALTER TABLE [post_group_visiblity] ADD FOREIGN KEY ([group_id]) REFERENCES [group] ([id])
GO
