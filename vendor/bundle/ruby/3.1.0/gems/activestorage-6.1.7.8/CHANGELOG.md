## Rails 6.1.7.8 (June 04, 2024)

- No changes.

## Rails 6.1.7.7 (February 21, 2024)

- Disables the session in `ActiveStorage::Blobs::ProxyController`
  and `ActiveStorage::Representations::ProxyController`
  in order to allow caching by default in some CDNs as CloudFlare

  Fixes #44136

  _Bruno Prieto_

## Rails 6.1.7.6 (August 22, 2023)

- No changes.

## Rails 6.1.7.5 (August 22, 2023)

- No changes.

## Rails 6.1.7.4 (June 26, 2023)

- No changes.

## Rails 6.1.7.3 (March 13, 2023)

- No changes.

## Rails 6.1.7.2 (January 24, 2023)

- No changes.

## Rails 6.1.7.1 (January 17, 2023)

- No changes.

## Rails 6.1.7 (September 09, 2022)

- Respect Active Record's primary_key_type in Active Storage migrations. Backported from 7.0.

  _fatkodima_

## Rails 6.1.6.1 (July 12, 2022)

- No changes.

## Rails 6.1.6 (May 09, 2022)

- No changes.

## Rails 6.1.5.1 (April 26, 2022)

- No changes.

## Rails 6.1.5 (March 09, 2022)

- Attachments can be deleted after their association is no longer defined.

  Fixes #42514

  _Don Sisco_

## Rails 6.1.4.7 (March 08, 2022)

- Added image transformation validation via configurable allow-list.

  Variant now offers a configurable allow-list for
  transformation methods in addition to a configurable deny-list for arguments.

  [CVE-2022-21831]

## Rails 6.1.4.6 (February 11, 2022)

- No changes.

## Rails 6.1.4.5 (February 11, 2022)

- No changes.

## Rails 6.1.4.4 (December 15, 2021)

- No changes.

## Rails 6.1.4.3 (December 14, 2021)

- No changes.

## Rails 6.1.4.2 (December 14, 2021)

- No changes.

## Rails 6.1.4.1 (August 19, 2021)

- No changes.

## Rails 6.1.4 (June 24, 2021)

- The parameters sent to `ffmpeg` for generating a video preview image are now
  configurable under `config.active_storage.video_preview_arguments`.

  _Brendon Muir_

- Fix Active Storage update task when running in an engine.

  _Justin Malčić_

- Don't raise an error if the mime type is not recognized.

  Fixes #41777.

  _Alex Ghiculescu_

- `ActiveStorage::PreviewError` is raised when a previewer is unable to generate a preview image.

  _Alex Robbin_

- respond with 404 given invalid variation key when asking for representations.

  _George Claghorn_

- `Blob` creation shouldn't crash if no service selected.

  _Alex Ghiculescu_

## Rails 6.1.3.2 (May 05, 2021)

- No changes.

## Rails 6.1.3.1 (March 26, 2021)

- Marcel is upgraded to version 1.0.0 to avoid a dependency on GPL-licensed
  mime types data.

  _George Claghorn_

## Rails 6.1.3 (February 17, 2021)

- No changes.

## Rails 6.1.2.1 (February 10, 2021)

- No changes.

## Rails 6.1.2 (February 09, 2021)

- No changes.

## Rails 6.1.1 (January 07, 2021)

- Fix S3 multipart uploads when threshold is larger than file.

  _Matt Muller_

## Rails 6.1.0 (December 09, 2020)

- Change default queue name of the analysis (`:active_storage_analysis`) and
  purge (`:active_storage_purge`) jobs to be the job adapter's default (`:default`).

  _Rafael Mendonça França_

- Implement `strict_loading` on ActiveStorage associations.

  _David Angulo_

- Remove deprecated support to pass `:combine_options` operations to `ActiveStorage::Transformers::ImageProcessing`.

  _Rafael Mendonça França_

- Remove deprecated `ActiveStorage::Transformers::MiniMagickTransformer`.

  _Rafael Mendonça França_

- Remove deprecated `config.active_storage.queue`.

  _Rafael Mendonça França_

- Remove deprecated `ActiveStorage::Downloading`.

  _Rafael Mendonça França_

- Add per-environment configuration support

  _Pietro Moro_

- The Poppler PDF previewer renders a preview image using the original
  document's crop box rather than its media box, hiding print margins. This
  matches the behavior of the MuPDF previewer.

  _Vincent Robert_

- Touch parent model when an attachment is purged.

  _Víctor Pérez Rodríguez_

- Files can now be served by proxying them from the underlying storage service
  instead of redirecting to a signed service URL. Use the
  `rails_storage_proxy_path` and `_url` helpers to proxy an attached file:

  ```erb
  <%= image_tag rails_storage_proxy_path(@user.avatar) %>
  ```

  To proxy by default, set `config.active_storage.resolve_model_to_route`:

  ```ruby
  # Proxy attached files instead.
  config.active_storage.resolve_model_to_route = :rails_storage_proxy
  ```

  ```erb
  <%= image_tag @user.avatar %>
  ```

  To redirect to a signed service URL when the default file serving strategy
  is set to proxying, use the `rails_storage_redirect_path` and `_url` helpers:

  ```erb
  <%= image_tag rails_storage_redirect_path(@user.avatar) %>
  ```

  _Jonathan Fleckenstein_

- Add `config.active_storage.web_image_content_types` to allow applications
  to add content types (like `image/webp`) in which variants can be processed,
  instead of letting those images be converted to the fallback PNG format.

  _Jeroen van Haperen_

- Add support for creating variants of `WebP` images out of the box.

  _Dino Maric_

- Only enqueue analysis jobs for blobs with non-null analyzer classes.

  _Gannon McGibbon_

- Previews are created on the same service as the original blob.

  _Peter Zhu_

- Remove unused `disposition` and `content_type` query parameters for `DiskService`.

  _Peter Zhu_

- Use `DiskController` for both public and private files.

  `DiskController` is able to handle multiple services by adding a
  `service_name` field in the generated URL in `DiskService`.

  _Peter Zhu_

- Variants are tracked in the database to avoid existence checks in the storage service.

  _George Claghorn_

- Deprecate `service_url` methods in favour of `url`.

  Deprecate `Variant#service_url` and `Preview#service_url` to instead use
  `#url` method to be consistent with `Blob`.

  _Peter Zhu_

- Permanent URLs for public storage blobs.

  Services can be configured in `config/storage.yml` with a new key
  `public: true | false` to indicate whether a service holds public
  blobs or private blobs. Public services will always return a permanent URL.

  Deprecates `Blob#service_url` in favor of `Blob#url`.

  _Peter Zhu_

- Make services aware of configuration names.

  _Gannon McGibbon_

- The `Content-Type` header is set on image variants when they're uploaded to third-party storage services.

  _Kyle Ribordy_

- Allow storage services to be configured per attachment.

  ```ruby
  class User < ActiveRecord::Base
    has_one_attached :avatar, service: :s3
  end

  class Gallery < ActiveRecord::Base
    has_many_attached :photos, service: :s3
  end
  ```

  _Dmitry Tsepelev_

- You can optionally provide a custom blob key when attaching a new file:

  ```ruby
  user.avatar.attach key: "avatars/#{user.id}.jpg",
    io: io, content_type: "image/jpeg", filename: "avatar.jpg"
  ```

  Active Storage will store the blob's data on the configured service at the provided key.

  _George Claghorn_

- Replace `Blob.create_after_upload!` with `Blob.create_and_upload!` and deprecate the former.

  `create_after_upload!` has been removed since it could lead to data
  corruption by uploading to a key on the storage service which happened to
  be already taken. Creating the record would then correctly raise a
  database uniqueness exception but the stored object would already have
  overwritten another. `create_and_upload!` swaps the order of operations
  so that the key gets reserved up-front or the uniqueness error gets raised,
  before the upload to a key takes place.

  _Julik Tarkhanov_

- Set content disposition in direct upload using `filename` and `disposition` parameters to `ActiveStorage::Service#headers_for_direct_upload`.

  _Peter Zhu_

- Allow record to be optionally passed to blob finders to make sharding
  easier.

  _Gannon McGibbon_

- Switch from `azure-storage` gem to `azure-storage-blob` gem for Azure service.

  _Peter Zhu_

- Add `config.active_storage.draw_routes` to disable Active Storage routes.

  _Gannon McGibbon_

- Image analysis is skipped if ImageMagick returns an error.

  `ActiveStorage::Analyzer::ImageAnalyzer#metadata` would previously raise a
  `MiniMagick::Error`, which caused persistent `ActiveStorage::AnalyzeJob`
  failures. It now logs the error and returns `{}`, resulting in no metadata
  being added to the offending image blob.

  _George Claghorn_

- Method calls on singular attachments return `nil` when no file is attached.

  Previously, assuming the following User model, `user.avatar.filename` would
  raise a `Module::DelegationError` if no avatar was attached:

  ```ruby
  class User < ApplicationRecord
    has_one_attached :avatar
  end
  ```

  They now return `nil`.

  _Matthew Tanous_

- The mirror service supports direct uploads.

  New files are directly uploaded to the primary service. When a
  directly-uploaded file is attached to a record, a background job is enqueued
  to copy it to each secondary service.

  Configure the queue used to process mirroring jobs by setting
  `config.active_storage.queues.mirror`. The default is `:active_storage_mirror`.

  _George Claghorn_

- The S3 service now permits uploading files larger than 5 gigabytes.

  When uploading a file greater than 100 megabytes in size, the service
  transparently switches to [multipart uploads](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html)
  using a part size computed from the file's total size and S3's part count limit.

  No application changes are necessary to take advantage of this feature. You
  can customize the default 100 MB multipart upload threshold in your S3
  service's configuration:

  ```yaml
  production:
    service: s3
    access_key_id: <%= Rails.application.credentials.dig(:aws, :access_key_id) %>
    secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
    region: us-east-1
    bucket: my-bucket
    upload:
      multipart_threshold: <%= 250.megabytes %>
  ```

  _George Claghorn_

Please check [6-0-stable](https://github.com/rails/rails/blob/6-0-stable/activestorage/CHANGELOG.md) for previous changes.
