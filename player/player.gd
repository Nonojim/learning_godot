extends CharacterBody2D

const SPEED = 100.0
var input_vector = Vector2.ZERO ## object scope
@onready var animation_tree: AnimationTree = $AnimationTree ## shortcut for get_node("AnimationTree")
##internal fn start by _
func _physics_process(_delta: float) -> void: ## ici delta precede underscore pour (void)delta
	input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input_vector != Vector2.ZERO:
		var direction_vector := Vector2(input_vector.x, -input_vector.y)
		update_blend_position(direction_vector)

	velocity = input_vector * SPEED
	move_and_slide()

func update_blend_position(direction_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/RunState/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/StandState/blend_position", direction_vector)
