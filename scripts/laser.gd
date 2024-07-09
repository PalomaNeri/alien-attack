extends Area2D

@export var speed = 120

func _physics_process(delta):
	global_position.x += speed*delta

func _on_visible_notifier_screen_exited():
	queue_free()

func _on_area_entered(area):
	queue_free()
	area.die()           	#function added in enemy script 
			#area.queue_free() would be simpler, I have plans for die function tho
