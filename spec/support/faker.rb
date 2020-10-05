# frozen_string_literal: true

# 多くのfakerは`:en`しかない。`:en`が`I18n.available_locales`にないとそれを参照
# 出来ずにエラーになる。
I18n.available_locales << :en
