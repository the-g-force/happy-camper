extends Node


func _ready() -> void:
	for file_name in DirAccess.get_files_at("res://enemy/images/"):
		if file_name.get_extension() == "png":
			var source : Texture2D = load("res://enemy/images/%s" % [file_name])
			
			var atlas_texture_1 := AtlasTexture.new()
			atlas_texture_1.atlas = source
			atlas_texture_1.region = Rect2(Vector2.ZERO, Vector2.ONE * 16)
			
			var atlas_texture_2 := AtlasTexture.new()
			atlas_texture_2.atlas = source
			atlas_texture_2.region = Rect2(Vector2(0, 16), Vector2.ONE * 16)
			
			var spriteframes := SpriteFrames.new()
			spriteframes.add_frame("default", atlas_texture_1)
			spriteframes.add_frame("default", atlas_texture_2)
			
			ResourceSaver.save(spriteframes, "res://enemy/spriteframes/%s.tres" % [file_name.get_basename()])
	
	print("SUCCESS")
