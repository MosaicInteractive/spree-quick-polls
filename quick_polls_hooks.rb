class QuickPollsHooks < Spree::ThemeSupport::HookListener
  insert_after :sidebar, 'shared/poll'
  insert_after :admin_configurations_menu, 'admin/poll_link'
end
