# frozen_string_literal: true

SecureHeaders::Configuration.default do |config|
  script_src =
    if Rails.env.development?
      %w[* 'unsafe-inline']
    else
      %w['self' https: 'unsafe-inline']
    end

  connect_src =
    if Rails.env.development?
      %w[*]
    else
      %w[wss:]
    end

  config.csp = {
    # "meta" values. these will shape the header, but the values are not included in the header.
    preserve_schemes: true, # default: false. Schemes are removed from host sources to save bytes and discourage mixed content.

    # directive values: these values will directly translate into source directives
    default_src: %w['self' https:],
    child_src: %w['self'], # if child-src isn't supported, the value for frame-src will be set.
    connect_src: connect_src,
    font_src: %w['self' data:],
    img_src: %w['self' https: data:],
    object_src: %w['self'],
    script_src: script_src,
    style_src: %w['self' 'unsafe-inline' https:],
  }
end
