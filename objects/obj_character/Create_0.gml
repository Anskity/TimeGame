motion = new Vector2(0, 0);
movement_manager = new MovementManager({motion: motion, inst: other});
character_controller = new CharacterController({motion: motion, inst: other});
instance_create_depth(0,0,0, obj_camera).inst = id;

state_map = ds_map_create();
state_map[? "state_normal"] = new State({
	update: function(_self) {
		_self.movement_manager.update();
		_self.character_controller.update();
	},
});

state_machine = new StateMachine({
	state_map: state_map,
	init_state: "state_normal",
});
