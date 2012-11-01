require 'rho/rhoapplication'
require 'mprodigy'

class AppApplication < Rho::RhoApplication
  def sessionId
    @sessionId
  end
    
  def sessionId=(val)
    @sessionId = val
  end

  def userId
    @userId
  end
    
  def userId=(val)
    @userId = val
  end

  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    @@tabbar = nil

    super

    SyncEngine::set_objectnotify_url("/app/Settings/sync_object_notify")
    
    # we want to be notified whenever either of these sources is synced
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
    SyncEngine.enable_status_popup(false)
    
  end
  
  def on_activate_app
    RhoLog::info("mProdigy::Application::on_activate_app", SyncEngine.logged_in)
  end

  def on_deactivate_app
    RhoLog::info("mProdigy::Application::on_deactivate_app", SyncEngine.logged_in)
  end

  def on_sync_user_changed
    RhoLog::info("mProdigy::Application::on_sync_user_changed", SyncEngine.logged_in)
    super
  end 

  def on_ui_created    
    RhoLog::info("mProdigy::Application::on_ui_created", SyncEngine.logged_in)
    super
  end

  def on_ui_destroyed
    RhoLog::info("mProdigy::Application::on_ui_destroyed", SyncEngine.logged_in)
  end

end
