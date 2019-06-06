extends KinematicBody2D

export var move_speed = 200

var motion = Vector2()

func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_left"):
		motion.x -= move_speed
		self.rotation = deg2rad(90)
	elif Input.is_action_pressed("ui_right"):
		motion.x += move_speed
		self.rotation = deg2rad(-90)
	elif Input.is_action_pressed("ui_up"):
		motion.y -= move_speed
		self.rotation = deg2rad(180)
	elif Input.is_action_pressed("ui_down"):
		motion.y += move_speed
		self.rotation = deg2rad(0)
	else:
		motion = Vector2(0, 0)
	
	motion = move_and_slide(motion).normalized()	
		
	var position2d_pos = $Position2D.position
	
	if Input.is_action_pressed("ui_select"):
		var shot_scene = preload("res://Shot.tscn").instance()
		get_parent().add_child(shot_scene)
		#get_parent().get_node(shot_scene).position = $Position2D.position
		shot_scene.position = $Position2D.global_position
		shot_scene.rotation = rotation