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

    Mprodigy::API::instrument
    SyncEngine::set_objectnotify_url("/app/Settings/sync_object_notify")
    
    # we want to be notified whenever either of these sources is synced
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
    SyncEngine.enable_status_popup(false)
    
  end
  
end
