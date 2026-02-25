@tool
extends EditorPlugin

const Components = preload("res://addons/editor_panels/components/components.gd")

const Layout = EditorPanelSingleton.PluginSplitPanel.Layout

func _get_plugin_name() -> String:
	return "Editor Panels"
func _get_plugin_icon() -> Texture2D:
	return EditorInterface.get_base_control().get_theme_icon("Window", &"EditorIcons")


const _PANELS = {
	"SceneViewer": Components.SceneViewer,
	"Collection": Components.CollectionPanel,
}

const _TABS = {
	"SceneViewer": Components.SceneViewer,
	"Collection": Components.CollectionPanel
}


func _enter_tree() -> void:
	_manage_registry(true)

func _exit_tree() -> void:
	_manage_registry(false)


func _manage_registry(register_state:bool):
	for _name in _TABS.keys():
		var _class = _TABS[_name]
		var path = _class
		if _class is Script:
			path = _class.resource_path
		elif _class is String:
			pass
		if register_state:
			EditorPanelSingleton.register_tab(_name, path)
		else:
			EditorPanelSingleton.unregister_tab(_name)
	
	for _name in _PANELS.keys():
		var _class = _PANELS[_name]
		var path = _class
		if _class is Script:
			path = _class.resource_path
		elif _class is String:
			pass
		if register_state:
			EditorPanelSingleton.register_panel(_name, path)
		else:
			EditorPanelSingleton.unregister_panel(_name)
		#EditorPanelSingleton.register_panel()
		pass
	

func _get_layouts():
	
	var layout = Layout.new()
	#layout.add_panel()
	
	
	pass



static func test():
	print(EditorPanelSingleton.get_registered_layouts())
