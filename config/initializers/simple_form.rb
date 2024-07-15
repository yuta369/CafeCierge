# frozen_string_literal: true

# 必要に応じて独自のコンポーネントを含めるために、この行のコメントを外し、パスを変更します。
# 詳細は、https://github.com/heartcombo/simple_form#custom-components を参照してください。
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }

# SimpleFormのすべてのオプションを設定するためのブロック
SimpleForm.setup do |config|
  # 入力全体を生成するためにフォームビルダーによって使用されるラッパー
  config.wrappers :default, class: :input,
    hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|

    ## デフォルトで有効な拡張機能
    b.use :html5
    b.use :placeholder

    ## オプションの拡張機能
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    ## 入力要素
    b.use :label_input
    b.use :hint, wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }

    # フルエラーメッセージを追加
    b.use :full_error, wrap_with: { tag: :span, class: :error }
  end

  # フォームビルダーで使用するデフォルトのラッパー
  config.default_wrapper = :default

  # チェックボックス/ラジオボタンのラベルの表示方法を定義
  config.boolean_style = :nested

  # ボタンのデフォルトクラス
  config.button_class = 'btn'

  # エラーを整理するために使用されるメソッド
  config.error_method = :to_sentence

  # エラー通知ヘルパーに使用するデフォルトのタグ
  config.error_notification_tag = :div

  # エラー通知ヘルパーに追加するCSSクラス
  config.error_notification_class = 'error_notification'

  # ラベルテキストを生成する方法を定義
  config.label_text = lambda { |label, required, explicit_label| "#{I18n.t(label, default: label)}#{required}" }

  # ネイティブHTML5バリデーションを使用するかどうかを指定
  config.browser_validations = false

  # 入力フィールドの検証クラスを定義
  config.input_field_valid_class = 'is-valid'
  config.input_field_error_class = 'is-invalid'

  # ブール入力のデフォルトの入力ラッパークラスを定義
  config.boolean_label_class = 'checkbox'
end