extends Area2D

var bullet_scene = preload("res://enemy_bullet.tscn")

func _on_shoot_timer_timeout():
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position)
	$ShootTimer.wait_time = randf_range(4, 20)
	$ShootTimer.start()

func explode():
	remove_from_group("enemies")
	$Sprite2D.hide()
	$AnimationPlayer.play("explosion")
	set_deferred("monitoring", false)
	await $AnimationPlayer.animation_finished
	queue_free()
	
