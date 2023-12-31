extends Area2D

@export var speed = 400

@onready var bgmusic = $"../Music/BGmusic"
@onready var enemy_hit = $"../Music/EnemyHit"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move-up"):
		velocity.y -= 1
	if Input.is_action_pressed("move-down"):
		velocity.y += 1
	if Input.is_action_pressed("move-left"):
		velocity.x -= 1
	if Input.is_action_pressed("move-right"):
		velocity.x += 1
		
	velocity = velocity.normalized() * speed
		
	position += velocity * delta
	



func _on_body_entered(body):
	hide()
	bgmusic.stop()
	enemy_hit.play()
