## Rails 6.1.7.8 (June 04, 2024)

- Include the HTTP Permissions-Policy on non-HTML Content-Types
  [CVE-2024-28103]

## Rails 6.1.7.7 (February 21, 2024)

- No changes.

## Rails 6.1.7.6 (August 22, 2023)

- No changes.

## Rails 6.1.7.5 (August 22, 2023)

- No changes.

## Rails 6.1.7.4 (June 26, 2023)

- Raise an exception if illegal characters are provide to redirect_to
  [CVE-2023-28362]

  _Zack Deveau_

## Rails 6.1.7.3 (March 13, 2023)

- No changes.

## Rails 6.1.7.2 (January 24, 2023)

- Fix `domain: :all` for two letter TLD

  This fixes a compatibility issue introduced in our previous security
  release when using `domain: :all` with a two letter but single level top
  level domain domain (like `.ca`, rather than `.co.uk`).

## Rails 6.1.7.1 (January 17, 2023)

- Avoid regex backtracking on If-None-Match header

  [CVE-2023-22795]

- Use string#split instead of regex for domain parts

  [CVE-2023-22792]

## Rails 6.1.7 (September 09, 2022)

- No changes.

## Rails 6.1.6.1 (July 12, 2022)

- No changes.

## Rails 6.1.6 (May 09, 2022)

- No changes.

## Rails 6.1.5.1 (April 26, 2022)

- Allow Content Security Policy DSL to generate for API responses.

  _Tim Wade_

## Rails 6.1.5 (March 09, 2022)

- Fix `content_security_policy` returning invalid directives.

  Directives such as `self`, `unsafe-eval` and few others were not
  single quoted when the directive was the result of calling a lambda
  returning an array.

  ```ruby
  content_security_policy do |policy|
    policy.frame_ancestors lambda { [:self, "https://example.com"] }
  end
  ```

  With this fix the policy generated from above will now be valid.

  _Edouard Chin_

- Update `HostAuthorization` middleware to render debug info only
  when `config.consider_all_requests_local` is set to true.

  Also, blocked host info is always logged with level `error`.

  Fixes #42813.

  _Nikita Vyrko_

- Dup arrays that get "converted".

  Fixes #43681.

  _Aaron Patterson_

- Don't show deprecation warning for equal paths.

  _Anton Rieder_

- Fix crash in `ActionController::Instrumentation` with invalid HTTP formats.

  Fixes #43094.

  _Alex Ghiculescu_

- Add fallback host for SystemTestCase driven by RackTest.

  Fixes #42780.

  _Petrik de Heus_

- Add more detail about what hosts are allowed.

  _Alex Ghiculescu_

## Rails 6.1.4.7 (March 08, 2022)

- No changes.

## Rails 6.1.4.6 (February 11, 2022)

- No changes.

## Rails 6.1.4.5 (February 11, 2022)

- Under certain circumstances, the middleware isn't informed that the
  response body has been fully closed which result in request state not
  being fully reset before the next request

  [CVE-2022-23633]

## Rails 6.1.4.4 (December 15, 2021)

- Fix issue with host protection not allowing host with port in development.

## Rails 6.1.4.3 (December 14, 2021)

- Fix issue with host protection not allowing localhost in development.

## Rails 6.1.4.2 (December 14, 2021)

- Fix X_FORWARDED_HOST protection. [CVE-2021-44528]

## Rails 6.1.4.1 (August 19, 2021)

- [CVE-2021-22942] Fix possible open redirect in Host Authorization middleware.

  Specially crafted "X-Forwarded-Host" headers in combination with certain
  "allowed host" formats can cause the Host Authorization middleware in Action
  Pack to redirect users to a malicious website.

## Rails 6.1.4 (June 24, 2021)

- Ignore file fixtures on `db:fixtures:load`

  _Kevin Sjöberg_

- Fix ActionController::Live controller test deadlocks by removing the body buffer size limit for tests.

  _Dylan Thacker-Smith_

- Correctly place optional path parameter booleans.

  Previously, if you specify a url parameter that is part of the path as false it would include that part
  of the path as parameter for example:

  ```
  get "(/optional/:optional_id)/things" => "foo#foo", as: :things
  things_path(optional_id: false) # => /things?optional_id=false
  ```

  After this change, true and false will be treated the same when used as optional path parameters. Meaning now:

  ```
  get '(this/:my_bool)/that' as: :that

  that_path(my_bool: true) # => `/this/true/that`
  that_path(my_bool: false) # => `/this/false/that`
  ```

  _Adam Hess_

- Add support for 'private, no-store' Cache-Control headers.

  Previously, 'no-store' was exclusive; no other directives could be specified.

  _Alex Smith_

## Rails 6.1.3.2 (May 05, 2021)

- Prevent open redirects by correctly escaping the host allow list
  CVE-2021-22903

- Prevent catastrophic backtracking during mime parsing
  CVE-2021-22902

- Prevent regex DoS in HTTP token authentication
  CVE-2021-22904

- Prevent string polymorphic route arguments.

  `url_for` supports building polymorphic URLs via an array
  of arguments (usually symbols and records). If a developer passes a
  user input array, strings can result in unwanted route helper calls.

  CVE-2021-22885

  _Gannon McGibbon_

## Rails 6.1.3.1 (March 26, 2021)

- No changes.

## Rails 6.1.3 (February 17, 2021)

- Re-define routes when not set correctly via inheritance.

  _John Hawthorn_

## Rails 6.1.2.1 (February 10, 2021)

- Prevent open redirect when allowed host starts with a dot

  [CVE-2021-22881]

  Thanks to @tktech (https://hackerone.com/tktech) for reporting this
  issue and the patch!

  _Aaron Patterson_

## Rails 6.1.2 (February 09, 2021)

- Fix error in `ActionController::LogSubscriber` that would happen when throwing inside a controller action.

  _Janko Marohnić_

- Fix `fixture_file_upload` deprecation when `file_fixture_path` is a relative path.

  _Eugene Kenny_

## Rails 6.1.1 (January 07, 2021)

- Fix nil translation key lookup in controllers/

  _Jan Klimo_

- Quietly handle unknown HTTP methods in Action Dispatch SSL middleware.

  _Alex Robbin_

- Change the request method to a `GET` when passing failed requests down to `config.exceptions_app`.

  _Alex Robbin_

## Rails 6.1.0 (December 09, 2020)

- Support for the HTTP header `Feature-Policy` has been revised to reflect
  its [rename](https://github.com/w3c/webappsec-permissions-policy/pull/379) to [`Permissions-Policy`](https://w3c.github.io/webappsec-permissions-policy/#permissions-policy-http-header-field).

  ```ruby
  Rails.application.config.permissions_policy do |p|
    p.camera     :none
    p.gyroscope  :none
    p.microphone :none
    p.usb        :none
    p.fullscreen :self
    p.payment    :self, "https://secure-example.com"
  end
  ```

  _Julien Grillot_

- Allow `ActionDispatch::HostAuthorization` to exclude specific requests.

  Host Authorization checks can be skipped for specific requests. This allows for health check requests to be permitted for requests with missing or non-matching host headers.

  _Chris Bisnett_

- Add `config.action_dispatch.request_id_header` to allow changing the name of
  the unique X-Request-Id header

  _Arlston Fernandes_

- Deprecate `config.action_dispatch.return_only_media_type_on_content_type`.

  _Rafael Mendonça França_

- Change `ActionDispatch::Response#content_type` to return the full Content-Type header.

  _Rafael Mendonça França_

- Remove deprecated `ActionDispatch::Http::ParameterFilter`.

  _Rafael Mendonça França_

- Added support for exclusive no-store Cache-Control header.

  If `no-store` is set on Cache-Control header it is exclusive (all other cache directives are dropped).

  _Chris Kruger_

- Catch invalid UTF-8 parameters for POST requests and respond with BadRequest.

  Additionally, perform `#set_binary_encoding` in `ActionDispatch::Http::Request#GET` and
  `ActionDispatch::Http::Request#POST` prior to validating encoding.

  _Adrianna Chang_

- Allow `assert_recognizes` routing assertions to work on mounted root routes.

  _Gannon McGibbon_

- Change default redirection status code for non-GET/HEAD requests to 308 Permanent Redirect for `ActionDispatch::SSL`.

  _Alan Tan_, _Oz Ben-David_

- Fix `follow_redirect!` to follow redirection with same HTTP verb when following
  a 308 redirection.

  _Alan Tan_

- When multiple domains are specified for a cookie, a domain will now be
  chosen only if it is equal to or is a superdomain of the request host.

  _Jonathan Hefner_

- `ActionDispatch::Static` handles precompiled Brotli (.br) files.

  Adds to existing support for precompiled gzip (.gz) files.
  Brotli files are preferred due to much better compression.

  When the browser requests /some.js with `Accept-Encoding: br`,
  we check for public/some.js.br and serve that file, if present, with
  `Content-Encoding: br` and `Vary: Accept-Encoding` headers.

  _Ryan Edward Hall_, _Jeremy Daer_

- Add raise_on_missing_translations support for controllers.

  This configuration determines whether an error should be raised for missing translations.
  It can be enabled through `config.i18n.raise_on_missing_translations`. Note that described
  configuration also affects raising error for missing translations in views.

  _fatkodima_

- Added `compact` and `compact!` to `ActionController::Parameters`.

  _Eugene Kenny_

- Calling `each_pair` or `each_value` on an `ActionController::Parameters`
  without passing a block now returns an enumerator.

  _Eugene Kenny_

- `fixture_file_upload` now uses path relative to `file_fixture_path`

  Previously the path had to be relative to `fixture_path`.
  You can change your existing code as follow:

  ```ruby
  # Before
  fixture_file_upload('files/dog.png')

  # After
  fixture_file_upload('dog.png')
  ```

  _Edouard Chin_

- Remove deprecated `force_ssl` at the controller level.

  _Rafael Mendonça França_

- The +helper+ class method for controllers loads helper modules specified as
  strings/symbols with `String#constantize` instead of `require_dependency`.

  Remember that support for strings/symbols is only a convenient API. You can
  always pass a module object:

  ```ruby
  helper UtilsHelper
  ```

  which is recommended because it is simple and direct. When a string/symbol
  is received, `helper` just manipulates and inflects the argument to obtain
  that same module object.

  _Xavier Noria_, _Jean Boussier_

- Correctly identify the entire localhost IPv4 range as trusted proxy.

  _Nick Soracco_

- `url_for` will now use "https://" as the default protocol when
  `Rails.application.config.force_ssl` is set to true.

  _Jonathan Hefner_

- Accept and default to base64_urlsafe CSRF tokens.

  Base64 strict-encoded CSRF tokens are not inherently websafe, which makes
  them difficult to deal with. For example, the common practice of sending
  the CSRF token to a browser in a client-readable cookie does not work properly
  out of the box: the value has to be url-encoded and decoded to survive transport.

  Now, we generate Base64 urlsafe-encoded CSRF tokens, which are inherently safe
  to transport. Validation accepts both urlsafe tokens, and strict-encoded tokens
  for backwards compatibility.

  _Scott Blum_

- Support rolling deploys for cookie serialization/encryption changes.

  In a distributed configuration like rolling update, users may observe
  both old and new instances during deployment. Users may be served by a
  new instance and then by an old instance.

  That means when the server changes `cookies_serializer` from `:marshal`
  to `:hybrid` or the server changes `use_authenticated_cookie_encryption`
  from `false` to `true`, users may lose their sessions if they access the
  server during deployment.

  We added fallbacks to downgrade the cookie format when necessary during
  deployment, ensuring compatibility on both old and new instances.

  _Masaki Hara_

- `ActionDispatch::Request.remote_ip` has ip address even when all sites are trusted.

  Before, if all `X-Forwarded-For` sites were trusted, the `remote_ip` would default to `127.0.0.1`.
  Now, the furthest proxy site is used. e.g.: It now gives an ip address when using curl from the load balancer.

  _Keenan Brock_

- Fix possible information leak / session hijacking vulnerability.

  The `ActionDispatch::Session::MemcacheStore` is still vulnerable given it requires the
  gem dalli to be updated as well.

  CVE-2019-16782.

- Include child session assertion count in ActionDispatch::IntegrationTest.

  `IntegrationTest#open_session` uses `dup` to create the new session, which
  meant it had its own copy of `@assertions`. This prevented the assertions
  from being correctly counted and reported.

  Child sessions now have their `attr_accessor` overridden to delegate to the
  root session.

  Fixes #32142.

  _Sam Bostock_

- Add SameSite protection to every written cookie.

  Enabling `SameSite` cookie protection is an addition to CSRF protection,
  where cookies won't be sent by browsers in cross-site POST requests when set to `:lax`.

  `:strict` disables cookies being sent in cross-site GET or POST requests.

  Passing `:none` disables this protection and is the same as previous versions albeit a `; SameSite=None` is appended to the cookie.

  See upgrade instructions in config/initializers/new_framework_defaults_6_1.rb.

  More info [here](https://tools.ietf.org/html/draft-west-first-party-cookies-07)

  _NB: Technically already possible as Rack supports SameSite protection, this is to ensure it's applied to all cookies_

  _Cédric Fabianski_

- Bring back the feature that allows loading external route files from the router.

  This feature existed back in 2012 but got reverted with the incentive that
  https://github.com/rails/routing_concerns was a better approach. Turned out
  that this wasn't fully the case and loading external route files from the router
  can be helpful for applications with a really large set of routes.
  Without this feature, application needs to implement routes reloading
  themselves and it's not straightforward.

  ```ruby
  # config/routes.rb

  Rails.application.routes.draw do
    draw(:admin)
  end

  # config/routes/admin.rb

  get :foo, to: 'foo#bar'
  ```

  _Yehuda Katz_, _Edouard Chin_

- Fix system test driver option initialization for non-headless browsers.

  _glaszig_

- `redirect_to.action_controller` notifications now include the `ActionDispatch::Request` in
  their payloads as `:request`.

  _Austin Story_

- `respond_to#any` no longer returns a response's Content-Type based on the
  request format but based on the block given.

  Example:

  ```ruby
    def my_action
      respond_to do |format|
        format.any { render(json: { foo: 'bar' }) }
      end
    end

    get('my_action.csv')
  ```

  The previous behaviour was to respond with a `text/csv` Content-Type which
  is inaccurate since a JSON response is being rendered.

  Now it correctly returns a `application/json` Content-Type.

  _Edouard Chin_

- Replaces (back)slashes in failure screenshot image paths with dashes.

  If a failed test case contained a slash or a backslash, a screenshot would be created in a
  nested directory, causing issues with `tmp:clear`.

  _Damir Zekic_

- Add `params.member?` to mimic Hash behavior.

  _Younes Serraj_

- `process_action.action_controller` notifications now include the following in their payloads:

  - `:request` - the `ActionDispatch::Request`
  - `:response` - the `ActionDispatch::Response`

  _George Claghorn_

- Updated `ActionDispatch::Request.remote_ip` setter to clear set the instance
  `remote_ip` to `nil` before setting the header that the value is derived
  from.

  Fixes #37383.

  _Norm Provost_

- `ActionController::Base.log_at` allows setting a different log level per request.

  ```ruby
  # Use the debug level if a particular cookie is set.
  class ApplicationController < ActionController::Base
    log_at :debug, if: -> { cookies[:debug] }
  end
  ```

  _George Claghorn_

- Allow system test screen shots to be taken more than once in
  a test by prefixing the file name with an incrementing counter.

  Add an environment variable `RAILS_SYSTEM_TESTING_SCREENSHOT_HTML` to
  enable saving of HTML during a screenshot in addition to the image.
  This uses the same image name, with the extension replaced with `.html`

  _Tom Fakes_

- Add `Vary: Accept` header when using `Accept` header for response.

  For some requests like `/users/1`, Rails uses requests' `Accept`
  header to determine what to return. And if we don't add `Vary`
  in the response header, browsers might accidentally cache different
  types of content, which would cause issues: e.g. javascript got displayed
  instead of html content. This PR fixes these issues by adding `Vary: Accept`
  in these types of requests. For more detailed problem description, please read:

  https://github.com/rails/rails/pull/36213

  Fixes #25842.

  _Stan Lo_

- Fix IntegrationTest `follow_redirect!` to follow redirection using the same HTTP verb when following
  a 307 redirection.

  _Edouard Chin_

- System tests require Capybara 3.26 or newer.

  _George Claghorn_

- Reduced log noise handling ActionController::RoutingErrors.

  _Alberto Fernández-Capel_

- Add DSL for configuring HTTP Feature Policy.

  This new DSL provides a way to configure an HTTP Feature Policy at a
  global or per-controller level. Full details of HTTP Feature Policy
  specification and guidelines can be found at MDN:

  https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Feature-Policy

  Example global policy:

  ```ruby
  Rails.application.config.feature_policy do |f|
    f.camera      :none
    f.gyroscope   :none
    f.microphone  :none
    f.usb         :none
    f.fullscreen  :self
    f.payment     :self, "https://secure.example.com"
  end
  ```

  Example controller level policy:

  ```ruby
  class PagesController < ApplicationController
    feature_policy do |p|
      p.geolocation "https://example.com"
    end
  end
  ```

  _Jacob Bednarz_

- Add the ability to set the CSP nonce only to the specified directives.

  Fixes #35137.

  _Yuji Yaginuma_

- Keep part when scope option has value.

  When a route was defined within an optional scope, if that route didn't
  take parameters the scope was lost when using path helpers. This commit
  ensures scope is kept both when the route takes parameters or when it
  doesn't.

  Fixes #33219.

  _Alberto Almagro_

- Added `deep_transform_keys` and `deep_transform_keys!` methods to ActionController::Parameters.

  _Gustavo Gutierrez_

- Calling `ActionController::Parameters#transform_keys`/`!` without a block now returns
  an enumerator for the parameters instead of the underlying hash.

  _Eugene Kenny_

- Fix strong parameters blocks all attributes even when only some keys are invalid (non-numerical).
  It should only block invalid key's values instead.

  _Stan Lo_

Please check [6-0-stable](https://github.com/rails/rails/blob/6-0-stable/actionpack/CHANGELOG.md) for previous changes.
