//Encapsulate Concept Creation
	CREATE (concept:Concept {
						label_name:'Concept',
						display_name:'Concept',
						description:'Concept',
						number:44
						})


	CREATE (qualia:Concept {
						label_name:'Qualia',
						display_name:'Qualia',
						description:'Qualia',
						number:22
						})

	CREATE (entanglement:Concept {
						label_name:'Entanglement',
						display_name:'Entanglement',
						description:'Entanglement',
						number:42
						})

	CREATE (meditation_type:Concept {
						label_name:'Meditation_Type',
						display_name:'Meditation_Type',
						description:'Stores the Type of Meditation',
						number:44
						})

	CREATE (meditation_instance:Concept {
						label_name:'Meditation_Instance',
						display_name:'Meditation_Instance',
						description:'Instance of a Meditation Type',
						number:44
						})

	CREATE (experience:Concept {
						label_name:'Experience',
						display_name:'Experience',
						description:'Instance of experience',
						number:44
						})

	CREATE (perception:Concept {
						label_name:'Perception',
						display_name:'Perception',
						description:'Type of Perception',
						number:44
						})

//Display Names

	CREATE (met_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_edittable:true,
		mandatory_field:true,
		has_multiple_values:false,
		hint:'',
		placeholder:'',
		eq_type:'qualia',
		select_options:[],
		field_order:1,
		data_type:'text',
		default_value:"null"
		})

	CREATE (mei_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_edittable:true,
		mandatory_field:true,
		has_multiple_values:false,
		hint:'',
		placeholder:'',
		eq_type:'qualia',
		select_options:[],
		field_order:1,
		data_type:'text',
		default_value:"null"
		})

	CREATE (exp_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_edittable:true,
		mandatory_field:true,
		has_multiple_values:false,
		hint:'',
		placeholder:'',
		eq_type:'qualia',
		select_options:[],
		field_order:1,
		data_type:'text',
		default_value:"null"
		})

	CREATE (per_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_edittable:true,
		mandatory_field:true,
		has_multiple_values:false,
		hint:'',
		placeholder:'',
		eq_type:'qualia',
		select_options:[],
		field_order:1,
		data_type:'text',
		default_value:"null"
		})

	CREATE (s_label_name:Qualia{
						db_key:'label_name',
						display_name:'Label Name',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:1,
						data_type:'text',
						default_value:"null"
						})


CREATE (s_display_name:Qualia{
					db_key:'display_name',
					display_name:'Display Name',
					is_edittable:true,
					mandatory_field:true,
					has_multiple_values:false,
					hint:'',
					placeholder:'',
					eq_type:'qualia',
					select_options:[],
					field_order:1,
					data_type:'text',
					default_value:"null"
					})


	CREATE (s_description:Qualia{
						db_key:'description',
						display_name:'Node Description',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:2,
						data_type:'text',
						default_value:"null"
						})

	CREATE (s_number:Qualia{
						db_key:'number',
						display_name:'Number',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:2,
						data_type:'number',
						default_value:'null'
						})
// Qualia Qualias
	CREATE (p_db_key:Qualia{
						db_key:'db_key',
						display_name:'Qualia Database Key',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:1,
						data_type:'text',
						default_value:'null'
						})

	CREATE (p_display_name:Qualia{
						db_key:'display_name',
						display_name:'Display Name',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:2,
						data_type:'text',
						default_value:'null'
						})

	CREATE (p_is_edittable:Qualia{
						db_key:'is_edittable',
						display_name:'Edittable?',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:3,
						data_type:'boolean',
						default_value:true
						})

	CREATE (p_mandatory_field:Qualia{
						db_key:'mandatory_field',
						display_name:'Mandatory Field?',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'boolean',
						default_value:false
						})

	CREATE (p_has_multiple_values:Qualia{
						db_key:'has_multiple_values',
						display_name:'Multiple Values?',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:5,
						data_type:'boolean',
						default_value:false
						})

	CREATE (p_select_options:Qualia{
						db_key:'select_options',
						display_name:'Select Options',
						is_edittable:true,
						mandatory_field:false,
						has_multiple_values:true,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:6,
						data_type:'text',
						default_value:['null']
						})

	CREATE (p_field_order:Qualia{
						db_key:'field_order',
						display_name:'Field Order',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:7,
						data_type:'number',
						default_value:9999
						})

	CREATE (p_data_type:Qualia{
						db_key:'data_type',
						display_name:'Data Type',
						is_edittable:true,
						mandatory_field:true,
						has_multiple_values:true,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:['text','textarea','number','date','boolean','text-array','text-select'],
						field_order:8,
						data_type:'text',
						default_value:'text'
						})

	CREATE (p_default_value:Qualia{
						db_key:'default_value',
						display_name:'Default Value',
						is_edittable:true,
						mandatory_field:false,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:9,
						data_type:'text',
						default_value:'null'
						})

	CREATE (e_db_type:Qualia{
			db_key:'db_type',
			display_name:'Entanglement Type',
			is_edittable:true,
			mandatory_field:true,
			has_multiple_values:false,
			hint:'',
			placeholder:'',
			eq_type:'qualia',
			select_options:[],
			field_order:2,
			data_type:'text',
			default_value:'null'
			})

	CREATE (e_display_name:Qualia{
			db_key:'display_name',
			display_name:'Display Name',
			is_edittable:true,
			mandatory_field:true,
			has_multiple_values:false,
			hint:'Whatever you want the Entanglement name to be displayed as',
			placeholder:'',
			eq_type:'qualia',
			select_options:[],
			field_order:1,
			data_type:'text',
			default_value:'null'
			})

	CREATE (e_cardinality:Qualia{
			db_key:'cardinality',
			display_name:'Cardinality',
			is_edittable:true,
			mandatory_field:true,
			has_multiple_values:false,
			hint:'',
			placeholder:'',
			eq_type:'qualia',
			select_options:['one-to-one','many-to-many','many-to-one'],
			field_order:1,
			data_type:'text_select',
			default_value:'null'
			})

	CREATE (e_creator:Qualia{
			db_key:'creator',
			display_name:'Entanglement Creator',
			is_edittable:true,
			mandatory_field:true,
			has_multiple_values:false,
			hint:'Select which Concept should be responsible to make this Entanglement',
			placeholder:'',
			eq_type:'qualia',
			select_options:['source','target','both','independent'],
			field_order:1,
			data_type:'text_radio',
			default_value:'null'
			})

//Encapsulates Entanglement Concepts


	CREATE (et_source:Entanglement{
		db_type:'source_concept',
		display_name:'Source Concept',
		cardinality:'one-to-one',
		creator:'source'
		})

	CREATE (et_target:Entanglement{
		db_type:'target_concept',
		display_name:'Target Concept',
		cardinality:'one-to-one',
		creator:'source'
		})

	CREATE (et_approved_entanglement:Entanglement{
		db_type:'approved_entanglement',
		display_name:'Entanglement',
		cardinality:'one-to-one',
		creator:'source'
		})

	CREATE (et_instance_of:Entanglement{
		db_type:'instance_of',
		display_name:'Instance Of',
		cardinality:'one-to-one',
		creator:'source'
		})

	CREATE (et_perceived:Entanglement{
		db_type:'perceived',
		display_name:'Perceived',
		cardinality:'one-to-one',
		creator:'source'
		})

	CREATE (et_best_maps_to:Entanglement{
		db_type:'best_maps_to',
		display_name:'Experiences Best Maps To',
		cardinality:'one-to-one',
		creator:'source'
		})

//Encapsulate Entanglements Assignments


	CREATE (et_source)<-[:approved_entanglement]-(entanglement),
	(et_instance_of)-[:target_concept]->(meditation_type),
	(et_instance_of)-[:source_concept]->(meditation_instance),
	(et_perceived)-[:target_concept]->(experience),
	(et_perceived)-[:source_concept]->(meditation_instance),
	(et_best_maps_to)-[:target_concept]->(perception),
	(et_best_maps_to)-[:source_concept]->(experience),
	(et_target)<-[:approved_entanglement]-(entanglement),
	(et_approved_entanglement)-[:target_concept]->(entanglement),
	(et_approved_entanglement)-[:source_concept]->(concept),
	(entanglement)<-[:source_concept]-(et_source),
	(concept)<-[:target_concept]-(et_source),
	(entanglement)<-[:source_concept]-(et_target),
	(concept)<-[:target_concept]-(et_target)

	CREATE (p_db_key)<-[:approved_qualia]-(qualia),
		(p_display_name)<-[:approved_qualia]-(qualia),
		(p_is_edittable)<-[:approved_qualia]-(qualia),
		(p_mandatory_field)<-[:approved_qualia]-(qualia),
		(p_has_multiple_values)<-[:approved_qualia]-(qualia),
		(p_select_options)<-[:approved_qualia]-(qualia),
		(p_field_order)<-[:approved_qualia]-(qualia),
		(p_data_type)<-[:approved_qualia]-(qualia),
		(p_default_value)<-[:approved_qualia]-(qualia),
		(s_label_name)<-[:approved_qualia]-(concept),
		(s_description)<-[:approved_qualia]-(concept),
		(s_number)<-[:approved_qualia]-(concept),
		(s_display_name)<-[:approved_qualia]-(concept),
		(e_db_type)<-[:approved_qualia]-(entanglement),
		(e_display_name)<-[:approved_qualia]-(entanglement),
		(e_cardinality)<-[:approved_qualia]-(entanglement),
		(met_display_name)<-[:approved_qualia]-(meditation_type),
		(mei_display_name)<-[:approved_qualia]-(meditation_instance),
		(exp_display_name)<-[:approved_qualia]-(experience),
		(per_display_name)<-[:approved_qualia]-(perception),
		(e_creator)<-[:approved_qualia]-(entanglement);
