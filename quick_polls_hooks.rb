class QuickPollsHooks < Spree::ThemeSupport::HookListener
  insert_after :sidebar, 'shared/poll'
end
