# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140606221733) do

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "columns_priv", id: false, force: true do |t|
    t.string    "Host",        limit: 60, default: "", null: false
    t.string    "Db",          limit: 64, default: "", null: false
    t.string    "User",        limit: 16, default: "", null: false
    t.string    "Table_name",  limit: 64, default: "", null: false
    t.string    "Column_name", limit: 64, default: "", null: false
    t.timestamp "Timestamp",                           null: false
    t.string    "Column_priv", limit: 0,  default: "", null: false
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "db", id: false, force: true do |t|
    t.string "Host",                  limit: 60, default: "",  null: false
    t.string "Db",                    limit: 64, default: "",  null: false
    t.string "User",                  limit: 16, default: "",  null: false
    t.string "Select_priv",           limit: 1,  default: "N", null: false
    t.string "Insert_priv",           limit: 1,  default: "N", null: false
    t.string "Update_priv",           limit: 1,  default: "N", null: false
    t.string "Delete_priv",           limit: 1,  default: "N", null: false
    t.string "Create_priv",           limit: 1,  default: "N", null: false
    t.string "Drop_priv",             limit: 1,  default: "N", null: false
    t.string "Grant_priv",            limit: 1,  default: "N", null: false
    t.string "References_priv",       limit: 1,  default: "N", null: false
    t.string "Index_priv",            limit: 1,  default: "N", null: false
    t.string "Alter_priv",            limit: 1,  default: "N", null: false
    t.string "Create_tmp_table_priv", limit: 1,  default: "N", null: false
    t.string "Lock_tables_priv",      limit: 1,  default: "N", null: false
    t.string "Create_view_priv",      limit: 1,  default: "N", null: false
    t.string "Show_view_priv",        limit: 1,  default: "N", null: false
    t.string "Create_routine_priv",   limit: 1,  default: "N", null: false
    t.string "Alter_routine_priv",    limit: 1,  default: "N", null: false
    t.string "Execute_priv",          limit: 1,  default: "N", null: false
    t.string "Event_priv",            limit: 1,  default: "N", null: false
    t.string "Trigger_priv",          limit: 1,  default: "N", null: false
  end

  add_index "db", ["User"], name: "User", using: :btree

  create_table "event", id: false, force: true do |t|
    t.string    "db",                   limit: 64,         default: "",        null: false
    t.string    "name",                 limit: 64,         default: "",        null: false
    t.binary    "body",                 limit: 2147483647,                     null: false
    t.string    "definer",              limit: 77,         default: "",        null: false
    t.datetime  "execute_at"
    t.integer   "interval_value"
    t.string    "interval_field",       limit: 18
    t.timestamp "created",                                                     null: false
    t.timestamp "modified",                                                    null: false
    t.datetime  "last_executed"
    t.datetime  "starts"
    t.datetime  "ends"
    t.string    "status",               limit: 18,         default: "ENABLED", null: false
    t.string    "on_completion",        limit: 8,          default: "DROP",    null: false
    t.string    "sql_mode",             limit: 0,          default: "",        null: false
    t.string    "comment",              limit: 64,         default: "",        null: false
    t.integer   "originator",                                                  null: false
    t.string    "time_zone",            limit: 64,         default: "SYSTEM",  null: false
    t.string    "character_set_client", limit: 32
    t.string    "collation_connection", limit: 32
    t.string    "db_collation",         limit: 32
    t.binary    "body_utf8",            limit: 2147483647
  end

  create_table "events", force: true do |t|
    t.integer  "member_id"
    t.string   "event_name"
    t.string   "event_desc"
    t.string   "venue"
    t.date     "event_date"
    t.time     "event_time"
    t.string   "event_status"
    t.integer  "orgn_id"
    t.integer  "template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "func", primary_key: "name", force: true do |t|
    t.boolean "ret",              default: false, null: false
    t.string  "dl",   limit: 128, default: "",    null: false
    t.string  "type", limit: 9,                   null: false
  end

  create_table "general_log", id: false, force: true do |t|
    t.timestamp "event_time",                    null: false
    t.text      "user_host",    limit: 16777215, null: false
    t.integer   "thread_id",    limit: 8,        null: false
    t.integer   "server_id",                     null: false
    t.string    "command_type", limit: 64,       null: false
    t.text      "argument",     limit: 16777215, null: false
  end

  create_table "help_category", primary_key: "help_category_id", force: true do |t|
    t.string  "name",               limit: 64, null: false
    t.integer "parent_category_id", limit: 2
    t.text    "url",                           null: false
  end

  add_index "help_category", ["name"], name: "name", unique: true, using: :btree

  create_table "help_keyword", primary_key: "help_keyword_id", force: true do |t|
    t.string "name", limit: 64, null: false
  end

  add_index "help_keyword", ["name"], name: "name", unique: true, using: :btree

  create_table "help_relation", id: false, force: true do |t|
    t.integer "help_topic_id",   null: false
    t.integer "help_keyword_id", null: false
  end

  create_table "help_topic", primary_key: "help_topic_id", force: true do |t|
    t.string  "name",             limit: 64, null: false
    t.integer "help_category_id", limit: 2,  null: false
    t.text    "description",                 null: false
    t.text    "example",                     null: false
    t.text    "url",                         null: false
  end

  add_index "help_topic", ["name"], name: "name", unique: true, using: :btree

  create_table "innodb_index_stats", id: false, force: true do |t|
    t.string    "database_name",    limit: 64,   null: false
    t.string    "table_name",       limit: 64,   null: false
    t.string    "index_name",       limit: 64,   null: false
    t.timestamp "last_update",                   null: false
    t.string    "stat_name",        limit: 64,   null: false
    t.integer   "stat_value",       limit: 8,    null: false
    t.integer   "sample_size",      limit: 8
    t.string    "stat_description", limit: 1024, null: false
  end

  create_table "innodb_table_stats", id: false, force: true do |t|
    t.string    "database_name",            limit: 64, null: false
    t.string    "table_name",               limit: 64, null: false
    t.timestamp "last_update",                         null: false
    t.integer   "n_rows",                   limit: 8,  null: false
    t.integer   "clustered_index_size",     limit: 8,  null: false
    t.integer   "sum_of_other_index_sizes", limit: 8,  null: false
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "ndb_binlog_index", id: false, force: true do |t|
    t.integer "Position",       limit: 8, null: false
    t.string  "File",                     null: false
    t.integer "epoch",          limit: 8, null: false
    t.integer "inserts",                  null: false
    t.integer "updates",                  null: false
    t.integer "deletes",                  null: false
    t.integer "schemaops",                null: false
    t.integer "orig_server_id",           null: false
    t.integer "orig_epoch",     limit: 8, null: false
    t.integer "gci",                      null: false
  end

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin", primary_key: "name", force: true do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proc", id: false, force: true do |t|
    t.string    "db",                   limit: 64,         default: "",             null: false
    t.string    "name",                 limit: 64,         default: "",             null: false
    t.string    "type",                 limit: 9,                                   null: false
    t.string    "specific_name",        limit: 64,         default: "",             null: false
    t.string    "language",             limit: 3,          default: "SQL",          null: false
    t.string    "sql_data_access",      limit: 17,         default: "CONTAINS_SQL", null: false
    t.string    "is_deterministic",     limit: 3,          default: "NO",           null: false
    t.string    "security_type",        limit: 7,          default: "DEFINER",      null: false
    t.binary    "param_list",                                                       null: false
    t.binary    "returns",              limit: 2147483647,                          null: false
    t.binary    "body",                 limit: 2147483647,                          null: false
    t.string    "definer",              limit: 77,         default: "",             null: false
    t.timestamp "created",                                                          null: false
    t.timestamp "modified",                                                         null: false
    t.string    "sql_mode",             limit: 0,          default: "",             null: false
    t.text      "comment",                                                          null: false
    t.string    "character_set_client", limit: 32
    t.string    "collation_connection", limit: 32
    t.string    "db_collation",         limit: 32
    t.binary    "body_utf8",            limit: 2147483647
  end

  create_table "procs_priv", id: false, force: true do |t|
    t.string    "Host",         limit: 60, default: "", null: false
    t.string    "Db",           limit: 64, default: "", null: false
    t.string    "User",         limit: 16, default: "", null: false
    t.string    "Routine_name", limit: 64, default: "", null: false
    t.string    "Routine_type", limit: 9,               null: false
    t.string    "Grantor",      limit: 77, default: "", null: false
    t.string    "Proc_priv",    limit: 0,  default: "", null: false
    t.timestamp "Timestamp",                            null: false
  end

  add_index "procs_priv", ["Grantor"], name: "Grantor", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proxies_priv", id: false, force: true do |t|
    t.string    "Host",         limit: 60, default: "",    null: false
    t.string    "User",         limit: 16, default: "",    null: false
    t.string    "Proxied_host", limit: 60, default: "",    null: false
    t.string    "Proxied_user", limit: 16, default: "",    null: false
    t.boolean   "With_grant",              default: false, null: false
    t.string    "Grantor",      limit: 77, default: "",    null: false
    t.timestamp "Timestamp",                               null: false
  end

  add_index "proxies_priv", ["Grantor"], name: "Grantor", using: :btree

  create_table "servers", primary_key: "Server_name", force: true do |t|
    t.string  "Host",     limit: 64, default: "", null: false
    t.string  "Db",       limit: 64, default: "", null: false
    t.string  "Username", limit: 64, default: "", null: false
    t.string  "Password", limit: 64, default: "", null: false
    t.integer "Port",                default: 0,  null: false
    t.string  "Socket",   limit: 64, default: "", null: false
    t.string  "Wrapper",  limit: 64, default: "", null: false
    t.string  "Owner",    limit: 64, default: "", null: false
  end

  create_table "slave_master_info", id: false, force: true do |t|
    t.integer "Number_of_lines",                                null: false
    t.text    "Master_log_name",                                null: false
    t.integer "Master_log_pos",         limit: 8,               null: false
    t.string  "Host",                   limit: 64, default: "", null: false
    t.text    "User_name"
    t.text    "User_password"
    t.integer "Port",                                           null: false
    t.integer "Connect_retry",                                  null: false
    t.boolean "Enabled_ssl",                                    null: false
    t.text    "Ssl_ca"
    t.text    "Ssl_capath"
    t.text    "Ssl_cert"
    t.text    "Ssl_cipher"
    t.text    "Ssl_key"
    t.boolean "Ssl_verify_server_cert",                         null: false
    t.float   "Heartbeat",                                      null: false
    t.text    "Bind"
    t.text    "Ignored_server_ids"
    t.text    "Uuid"
    t.integer "Retry_count",            limit: 8,               null: false
    t.text    "Ssl_crl"
    t.text    "Ssl_crlpath"
    t.boolean "Enabled_auto_position",                          null: false
  end

  create_table "slave_relay_log_info", primary_key: "Id", force: true do |t|
    t.integer "Number_of_lines",             null: false
    t.text    "Relay_log_name",              null: false
    t.integer "Relay_log_pos",     limit: 8, null: false
    t.text    "Master_log_name",             null: false
    t.integer "Master_log_pos",    limit: 8, null: false
    t.integer "Sql_delay",                   null: false
    t.integer "Number_of_workers",           null: false
  end

  create_table "slave_worker_info", primary_key: "Id", force: true do |t|
    t.text    "Relay_log_name",                       null: false
    t.integer "Relay_log_pos",              limit: 8, null: false
    t.text    "Master_log_name",                      null: false
    t.integer "Master_log_pos",             limit: 8, null: false
    t.text    "Checkpoint_relay_log_name",            null: false
    t.integer "Checkpoint_relay_log_pos",   limit: 8, null: false
    t.text    "Checkpoint_master_log_name",           null: false
    t.integer "Checkpoint_master_log_pos",  limit: 8, null: false
    t.integer "Checkpoint_seqno",                     null: false
    t.integer "Checkpoint_group_size",                null: false
    t.binary  "Checkpoint_group_bitmap",              null: false
  end

  create_table "slow_log", id: false, force: true do |t|
    t.timestamp "start_time",                      null: false
    t.text      "user_host",      limit: 16777215, null: false
    t.time      "query_time",                      null: false
    t.time      "lock_time",                       null: false
    t.integer   "rows_sent",                       null: false
    t.integer   "rows_examined",                   null: false
    t.string    "db",             limit: 512,      null: false
    t.integer   "last_insert_id",                  null: false
    t.integer   "insert_id",                       null: false
    t.integer   "server_id",                       null: false
    t.text      "sql_text",       limit: 16777215, null: false
    t.integer   "thread_id",      limit: 8,        null: false
  end

  create_table "tables_priv", id: false, force: true do |t|
    t.string    "Host",        limit: 60, default: "", null: false
    t.string    "Db",          limit: 64, default: "", null: false
    t.string    "User",        limit: 16, default: "", null: false
    t.string    "Table_name",  limit: 64, default: "", null: false
    t.string    "Grantor",     limit: 77, default: "", null: false
    t.timestamp "Timestamp",                           null: false
    t.string    "Table_priv",  limit: 0,  default: "", null: false
    t.string    "Column_priv", limit: 0,  default: "", null: false
  end

  add_index "tables_priv", ["Grantor"], name: "Grantor", using: :btree

  create_table "time_zone", primary_key: "Time_zone_id", force: true do |t|
    t.string "Use_leap_seconds", limit: 1, default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", force: true do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", force: true do |t|
    t.integer "Time_zone_id", null: false
  end

  create_table "time_zone_transition", id: false, force: true do |t|
    t.integer "Time_zone_id",                 null: false
    t.integer "Transition_time",    limit: 8, null: false
    t.integer "Transition_type_id",           null: false
  end

  create_table "time_zone_transition_type", id: false, force: true do |t|
    t.integer "Time_zone_id",                              null: false
    t.integer "Transition_type_id",                        null: false
    t.integer "Offset",                       default: 0,  null: false
    t.integer "Is_DST",             limit: 1, default: 0,  null: false
    t.string  "Abbreviation",       limit: 8, default: "", null: false
  end

  create_table "user", id: false, force: true do |t|
    t.string  "Host",                   limit: 60, default: "",  null: false
    t.string  "User",                   limit: 16, default: "",  null: false
    t.string  "Password",               limit: 41, default: "",  null: false
    t.string  "Select_priv",            limit: 1,  default: "N", null: false
    t.string  "Insert_priv",            limit: 1,  default: "N", null: false
    t.string  "Update_priv",            limit: 1,  default: "N", null: false
    t.string  "Delete_priv",            limit: 1,  default: "N", null: false
    t.string  "Create_priv",            limit: 1,  default: "N", null: false
    t.string  "Drop_priv",              limit: 1,  default: "N", null: false
    t.string  "Reload_priv",            limit: 1,  default: "N", null: false
    t.string  "Shutdown_priv",          limit: 1,  default: "N", null: false
    t.string  "Process_priv",           limit: 1,  default: "N", null: false
    t.string  "File_priv",              limit: 1,  default: "N", null: false
    t.string  "Grant_priv",             limit: 1,  default: "N", null: false
    t.string  "References_priv",        limit: 1,  default: "N", null: false
    t.string  "Index_priv",             limit: 1,  default: "N", null: false
    t.string  "Alter_priv",             limit: 1,  default: "N", null: false
    t.string  "Show_db_priv",           limit: 1,  default: "N", null: false
    t.string  "Super_priv",             limit: 1,  default: "N", null: false
    t.string  "Create_tmp_table_priv",  limit: 1,  default: "N", null: false
    t.string  "Lock_tables_priv",       limit: 1,  default: "N", null: false
    t.string  "Execute_priv",           limit: 1,  default: "N", null: false
    t.string  "Repl_slave_priv",        limit: 1,  default: "N", null: false
    t.string  "Repl_client_priv",       limit: 1,  default: "N", null: false
    t.string  "Create_view_priv",       limit: 1,  default: "N", null: false
    t.string  "Show_view_priv",         limit: 1,  default: "N", null: false
    t.string  "Create_routine_priv",    limit: 1,  default: "N", null: false
    t.string  "Alter_routine_priv",     limit: 1,  default: "N", null: false
    t.string  "Create_user_priv",       limit: 1,  default: "N", null: false
    t.string  "Event_priv",             limit: 1,  default: "N", null: false
    t.string  "Trigger_priv",           limit: 1,  default: "N", null: false
    t.string  "Create_tablespace_priv", limit: 1,  default: "N", null: false
    t.string  "ssl_type",               limit: 9,  default: "",  null: false
    t.binary  "ssl_cipher",                                      null: false
    t.binary  "x509_issuer",                                     null: false
    t.binary  "x509_subject",                                    null: false
    t.integer "max_questions",                     default: 0,   null: false
    t.integer "max_updates",                       default: 0,   null: false
    t.integer "max_connections",                   default: 0,   null: false
    t.integer "max_user_connections",              default: 0,   null: false
    t.string  "plugin",                 limit: 64, default: ""
    t.text    "authentication_string"
    t.string  "password_expired",       limit: 1,  default: "N", null: false
  end

end
