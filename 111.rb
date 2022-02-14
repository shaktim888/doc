  project_name = `ls | grep .xcodeproj`.strip
  project = Xcodeproj::Project.open(project_name)
  def changeCfg (config, attr)
    if config.build_settings[attr].is_a? String then
      config.build_settings[attr] = [config.build_settings[attr]]
    end
    if config.build_settings[attr] and not config.build_settings[attr].include? "$(inherited)" then
      config.build_settings[attr] << "$(inherited)"
      puts "[" + config.name + "] auto add \"$(inherited)\":" + attr
    end
  end
  project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["COMPRESS_PNG_FILES"]="NO"
      config.build_settings["STRIP_PNG_TEXT"]="NO"
      changeCfg(config, "OTHER_LDFLAGS")
      changeCfg(config, "LIBRARY_SEARCH_PATHS")
      changeCfg(config, "HEADER_SEARCH_PATHS")
      changeCfg(config, "GCC_PREPROCESSOR_DEFINITIONS")
      @INFOPLIST = config.build_settings["INFOPLIST_FILE"]
      `/usr/libexec/PlistBuddy -c "Delete :NSAppTransportSecurity" "#{@INFOPLIST}"`
      `/usr/libexec/PlistBuddy -c "Add :NSAppTransportSecurity" "#{@INFOPLIST}"`
      `/usr/libexec/PlistBuddy -c "Add :NSAppTransportSecurity:NSAllowsArbitraryLoads bool true" "#{@INFOPLIST}"`
    end
  end
  project.save