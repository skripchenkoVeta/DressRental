# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_206_194_443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'buyer_infos', force: :cascade do |t|
    t.date 'birthday'
    t.string 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'message'
    t.bigint 'user_id'
    t.string 'commentable_type'
    t.bigint 'commentable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[commentable_type commentable_id], name: 'index_comments_on_commentable'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'product_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.float 'price'
    t.bigint 'salon_id'
    t.bigint 'product_type_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_type_id'], name: 'index_products_on_product_type_id'
    t.index ['salon_id'], name: 'index_products_on_salon_id'
  end

  create_table 'salons', force: :cascade do |t|
    t.string 'name'
    t.text 'address'
    t.bigint 'seller_info_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['seller_info_id'], name: 'index_salons_on_seller_info_id'
  end

  create_table 'seller_infos', force: :cascade do |t|
    t.integer 'unp'
    t.integer 'kpp'
    t.string 'supplier_name'
    t.bigint 'seller_type_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['seller_type_id'], name: 'index_seller_infos_on_seller_type_id'
  end

  create_table 'seller_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'surname'
    t.string 'email'
    t.string 'number'
    t.string 'password'
    t.string 'role'
    t.string 'profileable_type'
    t.bigint 'profileable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[profileable_type profileable_id], name: 'index_users_on_profileable'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
end
