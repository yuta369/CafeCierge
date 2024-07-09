## Rails 6.1.7.8 (June 04, 2024)

- No changes.

## Rails 6.1.7.7 (February 21, 2024)

- No changes.

## Rails 6.1.7.6 (August 22, 2023)

- No changes.

## Rails 6.1.7.5 (August 22, 2023)

- No changes.

## Rails 6.1.7.4 (June 26, 2023)

- No changes.

## Rails 6.1.7.3 (March 13, 2023)

- Ignore certain data-\* attributes in rails-ujs when element is contenteditable

  [CVE-2023-23913]

## Rails 6.1.7.2 (January 24, 2023)

- No changes.

## Rails 6.1.7.1 (January 17, 2023)

- No changes.

## Rails 6.1.7 (September 09, 2022)

- No changes.

## Rails 6.1.6.1 (July 12, 2022)

- No changes.

## Rails 6.1.6 (May 09, 2022)

- No changes.

## Rails 6.1.5.1 (April 26, 2022)

- Fix and add protections for XSS in `ActionView::Helpers` and `ERB::Util`.

  Escape dangerous characters in names of tags and names of attributes in the
  tag helpers, following the XML specification. Rename the option
  `:escape_attributes` to `:escape`, to simplify by applying the option to the
  whole tag.

  _Álvaro Martín Fraguas_

## Rails 6.1.5 (March 09, 2022)

- `preload_link_tag` properly inserts `as` attributes for files with `image` MIME
  types, such as JPG or SVG.

  _Nate Berkopec_

- Add `autocomplete="off"` to all generated hidden fields.

  Fixes #42610.

  _Ryan Baumann_

- Fix `current_page?` when URL has trailing slash.

  This fixes the `current_page?` helper when the given URL has a trailing slash,
  and is an absolute URL or also has query params.

  Fixes #33956.

  _Jonathan Hefner_

## Rails 6.1.4.7 (March 08, 2022)

- No changes.

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

- The `translate` helper now passes `default` values that aren't
  translation keys through `I18n.translate` for interpolation.

  _Jonathan Hefner_

- Don't attach UJS form submission handlers to Turbo forms.

  _David Heinemeier Hansson_

- Allow both `current_page?(url_hash)` and `current_page?(**url_hash)` on Ruby 2.7.

  _Ryuta Kamizono_

## Rails 6.1.3.2 (May 05, 2021)

- No changes.

## Rails 6.1.3.1 (March 26, 2021)

- No changes.

## Rails 6.1.3 (February 17, 2021)

- No changes.

## Rails 6.1.2.1 (February 10, 2021)

- No changes.

## Rails 6.1.2 (February 09, 2021)

- No changes.

## Rails 6.1.1 (January 07, 2021)

- Fix lazy translation in partial with block.

  _Marek Kasztelnik_

- Avoid extra `SELECT COUNT` queries when rendering Active Record collections.

  _aar0nr_

- Link preloading keep integrity hashes in the header.

  _Étienne Barrié_

- Add `config.action_view.preload_links_header` to allow disabling of
  the `Link` header being added by default when using `stylesheet_link_tag`
  and `javascript_include_tag`.

  _Andrew White_

- The `translate` helper now resolves `default` values when a `nil` key is
  specified, instead of always returning `nil`.

  _Jonathan Hefner_

## Rails 6.1.0 (December 09, 2020)

- SanitizeHelper.sanitized_allowed_attributes and SanitizeHelper.sanitized_allowed_tags
  call safe_list_sanitizer's class method

  Fixes #39586

  _Taufiq Muhammadi_

- Change form_with to generate non-remote forms by default.

  `form_with` would generate a remote form by default. This would confuse
  users because they were forced to handle remote requests.

  All new 6.1 applications will generate non-remote forms by default.
  When upgrading a 6.0 application you can enable remote forms by default by
  setting `config.action_view.form_with_generates_remote_forms` to `true`.

  _Petrik de Heus_

- Yield translated strings to calls of `ActionView::FormBuilder#button`
  when a block is given.

  _Sean Doyle_

- Alias `ActionView::Helpers::Tags::Label::LabelBuilder#translation` to
  `#to_s` so that `form.label` calls can yield that value to their blocks.

  _Sean Doyle_

- Rename the new `TagHelper#class_names` method to `TagHelper#token_list`,
  and make the original available as an alias.

      token_list("foo", "foo bar")
      # => "foo bar"

  _Sean Doyle_

- ARIA Array and Hash attributes are treated as space separated `DOMTokenList`
  values. This is useful when declaring lists of label text identifiers in
  `aria-labelledby` or `aria-describedby`.

      tag.input type: 'checkbox', name: 'published', aria: {
        invalid: @post.errors[:published].any?,
        labelledby: ['published_context', 'published_label'],
        describedby: { published_errors: @post.errors[:published].any? }
      }
      #=> <input
            type="checkbox" name="published" aria-invalid="true"
            aria-labelledby="published_context published_label"
            aria-describedby="published_errors"
          >

  _Sean Doyle_

- Remove deprecated `escape_whitelist` from `ActionView::Template::Handlers::ERB`.

  _Rafael Mendonça França_

- Remove deprecated `find_all_anywhere` from `ActionView::Resolver`.

  _Rafael Mendonça França_

- Remove deprecated `formats` from `ActionView::Template::HTML`.

  _Rafael Mendonça França_

- Remove deprecated `formats` from `ActionView::Template::RawFile`.

  _Rafael Mendonça França_

- Remove deprecated `formats` from `ActionView::Template::Text`.

  _Rafael Mendonça França_

- Remove deprecated `find_file` from `ActionView::PathSet`.

  _Rafael Mendonça França_

- Remove deprecated `rendered_format` from `ActionView::LookupContext`.

  _Rafael Mendonça França_

- Remove deprecated `find_file` from `ActionView::ViewPaths`.

  _Rafael Mendonça França_

- Require that `ActionView::Base` subclasses implement `#compiled_method_container`.

  _Rafael Mendonça França_

- Remove deprecated support to pass an object that is not a `ActionView::LookupContext` as the first argument
  in `ActionView::Base#initialize`.

  _Rafael Mendonça França_

- Remove deprecated `format` argument `ActionView::Base#initialize`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#refresh`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#original_encoding`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#variants`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#formats`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#virtual_path=`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template#updated_at`.

  _Rafael Mendonça França_

- Remove deprecated `updated_at` argument required on `ActionView::Template#initialize`.

  _Rafael Mendonça França_

- Make `locals` argument required on `ActionView::Template#initialize`.

  _Rafael Mendonça França_

- Remove deprecated `ActionView::Template.finalize_compiled_template_methods`.

  _Rafael Mendonça França_

- Remove deprecated `config.action_view.finalize_compiled_template_methods`

  _Rafael Mendonça França_

- Remove deprecated support to calling `ActionView::ViewPaths#with_fallback` with a block.

  _Rafael Mendonça França_

- Remove deprecated support to passing absolute paths to `render template:`.

  _Rafael Mendonça França_

- Remove deprecated support to passing relative paths to `render file:`.

  _Rafael Mendonça França_

- Remove support to template handlers that don't accept two arguments.

  _Rafael Mendonça França_

- Remove deprecated pattern argument in `ActionView::Template::PathResolver`.

  _Rafael Mendonça França_

- Remove deprecated support to call private methods from object in some view helpers.

  _Rafael Mendonça França_

- `ActionView::Helpers::TranslationHelper#translate` accepts a block, yielding
  the translated text and the fully resolved translation key:

      <%= translate(".relative_key") do |translation, resolved_key| %>
        <span title="<%= resolved_key %>"><%= translation %></span>
      <% end %>

  _Sean Doyle_

- Ensure cache fragment digests include all relevant template dependencies when
  fragments are contained in a block passed to the render helper. Remove the
  virtual_path keyword arguments found in CacheHelper as they no longer possess
  any function following 1581cab.

  Fixes #38984.

  _Aaron Lipman_

- Deprecate `config.action_view.raise_on_missing_translations` in favor of
  `config.i18n.raise_on_missing_translations`.

  New generalized configuration option now determines whether an error should be raised
  for missing translations in controllers and views.

  _fatkodima_

- Instrument layout rendering in `TemplateRenderer#render_with_layout` as `render_layout.action_view`,
  and include (when necessary) the layout's virtual path in notification payloads for collection and partial renders.

  _Zach Kemp_

- `ActionView::Base.annotate_rendered_view_with_filenames` annotates HTML output with template file names.

  _Joel Hawksley_, _Aaron Patterson_

- `ActionView::Helpers::TranslationHelper#translate` returns nil when
  passed `default: nil` without a translation matching `I18n#translate`.

  _Stefan Wrobel_

- `OptimizedFileSystemResolver` prefers template details in order of locale,
  formats, variants, handlers.

  _Iago Pimenta_

- Added `class_names` helper to create a CSS class value with conditional classes.

  _Joel Hawksley_, _Aaron Patterson_

- Add support for conditional values to TagBuilder.

  _Joel Hawksley_

- `ActionView::Helpers::FormOptionsHelper#select` should mark option for `nil` as selected.

  ```ruby
  @post = Post.new
  @post.category = nil

  # Before
  select("post", "category", none: nil, programming: 1, economics: 2)
  # =>
  # <select name="post[category]" id="post_category">
  #   <option value="">none</option>
  #  <option value="1">programming</option>
  #  <option value="2">economics</option>
  # </select>

  # After
  select("post", "category", none: nil, programming: 1, economics: 2)
  # =>
  # <select name="post[category]" id="post_category">
  #   <option selected="selected" value="">none</option>
  #  <option value="1">programming</option>
  #  <option value="2">economics</option>
  # </select>
  ```

  _bogdanvlviv_

- Log lines for partial renders and started template renders are now
  emitted at the `DEBUG` level instead of `INFO`.

  Completed template renders are still logged at the `INFO` level.

  _DHH_

- ActionView::Helpers::SanitizeHelper: support rails-html-sanitizer 1.1.0.

  _Juanito Fatas_

- Added `phone_to` helper method to create a link from mobile numbers.

  _Pietro Moro_

- annotated_source_code returns an empty array so TemplateErrors without a
  template in the backtrace are surfaced properly by DebugExceptions.

  _Guilherme Mansur_, _Kasper Timm Hansen_

- Add autoload for SyntaxErrorInTemplate so syntax errors are correctly raised by DebugExceptions.

  _Guilherme Mansur_, _Gannon McGibbon_

- `RenderingHelper` supports rendering objects that `respond_to?` `:render_in`.

  _Joel Hawksley_, _Natasha Umer_, _Aaron Patterson_, _Shawn Allen_, _Emily Plummer_, _Diana Mounter_, _John Hawthorn_, _Nathan Herald_, _Zaid Zawaideh_, _Zach Ahn_

- Fix `select_tag` so that it doesn't change `options` when `include_blank` is present.

  _Younes SERRAJ_

Please check [6-0-stable](https://github.com/rails/rails/blob/6-0-stable/actionview/CHANGELOG.md) for previous changes.
