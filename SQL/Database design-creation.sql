SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [customers] (
    [cust_id] int  NOT NULL ,
    [customer_firstname] varchar(50)  NOT NULL ,
    [customer_lastname] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED (
        [cust_id] ASC
    )
)

CREATE TABLE [address] (
    [add_id] int  NOT NULL ,
    [delivery_address_1] varchar(250)  NOT NULL ,
    [delivery_address_2] varchar(250)  NOT NULL ,
    [delivery_city] varchar(50)  NOT NULL ,
    [delivery_zipcode] varchar(20)  NOT NULL ,
    CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED (
        [add_id] ASC
    )
)

CREATE TABLE [items] (
    [item_id] varchar(20)  NOT NULL ,
    [sku] varchar(50)  NOT NULL ,
    [item_name] varchar(100)  NOT NULL ,
    [item_category] varchar(100)  NOT NULL ,
    [item_price] decimal(5,2)  NOT NULL ,
    [item_size] varchar(20)  NOT NULL ,
	CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED (
        [item_id] ASC
	) ,
	CONSTRAINT [UQ_items_sku] UNIQUE ([sku])
)

CREATE TABLE [orders] (
    [row_id] int  NOT NULL ,
    [order_id] varchar(10)  NOT NULL ,
    [created_at] date  NOT NULL ,
    [quantity] int  NOT NULL ,
    [cust_id] int  NOT NULL ,
    [add_id] int  NOT NULL ,
    [item_id] varchar(20)  NOT NULL ,
    [delivery] BIT  NOT NULL ,
    CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

CREATE TABLE [staff] (
    [staff_id] varchar(20)  NOT NULL ,
    [firstname] varchar(50)  NOT NULL ,
    [lastname] varchar(50)  NOT NULL ,
    [hour_rate] decimal(5,2)  NOT NULL ,
    [position] varchar(50)  NOT NULL 
)

CREATE TABLE [shift] (
    [shift_id] varchar(20)  NOT NULL ,
    [start] time  NOT NULL ,
    [end] time  NOT NULL ,
    [day] varchar(20)  NOT NULL 
)

CREATE TABLE [rota] (
    [row_id] int  NOT NULL ,
    [rota_id] varchar(20)  NOT NULL ,
    [staff_id] varchar(20)  NOT NULL ,
    [shift_id] varchar(20)  NOT NULL ,
    [date] date  NOT NULL ,
    CONSTRAINT [PK_rota] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

CREATE TABLE [ingredients] (
    [ing_id] varchar(20)  NOT NULL ,
    [ing_name] varchar(100)  NOT NULL ,
    [ing_weight] int  NOT NULL ,
    [ing_measure] varchar(20)  NOT NULL ,
    [ing_price] decimal(5,2)  NOT NULL ,
    CONSTRAINT [PK_ingredients] PRIMARY KEY CLUSTERED (
        [ing_id] ASC
    )
)

CREATE TABLE [inventory] (
    [inventory_id] varchar(50)  NOT NULL ,
    [item_id] varchar(20)  NOT NULL ,
    [quantity] int  NOT NULL 
)

CREATE TABLE [recipe] (
    [row_id] int  NOT NULL ,
    [recipe_id] varchar(50)  NOT NULL ,
    [ing_id] varchar(20)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_recipe] PRIMARY KEY CLUSTERED (
        [row_id] ASC
    )
)

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_orders_cust_id] FOREIGN KEY([cust_id])
REFERENCES [customers] ([cust_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_cust_id]

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_orders_add_id] FOREIGN KEY([add_id])
REFERENCES [address] ([add_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_add_id]

ALTER TABLE [orders] WITH CHECK ADD CONSTRAINT [FK_orders_item_id] FOREIGN KEY([item_id])
REFERENCES [items] ([item_id])

ALTER TABLE [orders] CHECK CONSTRAINT [FK_orders_item_id]

ALTER TABLE [inventory] WITH CHECK ADD CONSTRAINT [FK_inventory_item_id] FOREIGN KEY([item_id])
REFERENCES [ingredients] ([ing_id])

ALTER TABLE [inventory] CHECK CONSTRAINT [FK_inventory_item_id]

ALTER TABLE [recipe] WITH CHECK ADD CONSTRAINT [FK_recipe_recipe_id] FOREIGN KEY([recipe_id])
REFERENCES [items] ([sku])

ALTER TABLE [recipe] CHECK CONSTRAINT [FK_recipe_recipe_id]

ALTER TABLE [recipe] WITH CHECK ADD CONSTRAINT [FK_recipe_ing_id] FOREIGN KEY([ing_id])
REFERENCES [ingredients] ([ing_id])

ALTER TABLE [recipe] CHECK CONSTRAINT [FK_recipe_ing_id]

COMMIT TRANSACTION QUICKDBD