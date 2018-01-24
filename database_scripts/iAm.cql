// iAm Concepts

  CREATE (meditation_instance:Concept {
            label_name:'Meditation_Instance',
            display_name:'Meditation_Instance',
            description:'Instance of a Meditation Type'
            })

  CREATE (experience:Concept {
            label_name:'Experience',
            display_name:'Experience',
            description:'Instance of experience'
            })

  CREATE (perception:Concept {
            label_name:'Perception',
            display_name:'Perception',
            description:'Type of Perception'
            })

	CREATE (meditation_type:Concept {
						label_name:'Meditation_Type',
						display_name:'Meditation_Type',
						description:'Stores the Type of Meditation'
						})


// Meditation Type Qualias
  CREATE (met_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_editable:true,
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

// Meditation Instance Qualias
    CREATE (mei_display_name:Qualia{
    db_key:'display_name',
    display_name:'Display Name',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'text',
    default_value:null
    })

    CREATE (mei_duration_of_meditation:Qualia{
    db_key:'duration_of_meditation',
    display_name:'Duration (Seconds)',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'number',
    default_value:null
    })

    CREATE (mei_start_time:Qualia{
    db_key:'start_time',
    display_name:'Start Time',
    is_editable:false,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'timestamp',
    default_value:null
    })

    CREATE (mei_finish_time:Qualia{
    db_key:'finish_time',
    display_name:'Finish Time',
    is_editable:false,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'timestamp',
    default_value:null
    })

    CREATE (mei_focus:Qualia{
    db_key:'focus',
    display_name:'Object of Focus',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:['undirect','breathing'],
    field_order:1,
    data_type:'text_select',
    default_value:null
    })

    CREATE (mei_date_of_meditation:Qualia{
    db_key:'date_of_meditation',
    display_name:'Date of Meditation',
    is_editable:false,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'datestamp',
    default_value:'undirected'
    })

    CREATE (mei_notes:Qualia{
    db_key:'notes',
    display_name:'Notes',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'text',
    default_value:null
    })

// Experience Qualias
	CREATE (exp_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_editable:true,
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

CREATE (exp_utc_timestamp_of_experience:Qualia{
db_key:'utc_timestamp_of_experience',
display_name:'Timestamp',
is_editable:false,
mandatory_field:true,
has_multiple_values:false,
hint:'',
placeholder:'',
eq_type:'qualia',
select_options:[],
field_order:1,
data_type:'timestamp',
default_value:null
})

CREATE (exp_time_on_timer:Qualia{
db_key:'time_on_timer',
display_name:'Time on Timer',
is_editable:false,
mandatory_field:true,
has_multiple_values:false,
hint:'',
placeholder:'',
eq_type:'qualia',
select_options:[],
field_order:1,
data_type:'number',
default_value:null
})




// Perception qualias
  CREATE (per_display_name:Qualia{
		db_key:'display_name',
		display_name:'Display Name',
		is_editable:true,
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


// Entanglements


  CREATE (et_instance_of:Entanglement{
  	db_type:'instance_of',
  	mandatory_field:true,
  	display_name:'Instance Of',
  	cardinality:'one-to-one',
  	is_editable:true,
  	creator:'source'
  	})

  CREATE (et_perceived:Entanglement{
  	db_type:'perceived',
  	display_name:'Perceived',
  	mandatory_field:true,
  	cardinality:'one-to-one',
  	is_editable:true,
  	creator:'source'
  	})

  CREATE (et_best_maps_to:Entanglement{
  	db_type:'best_maps_to',
  	display_name:'Experiences Best Maps To',
  	cardinality:'one-to-one',
  	mandatory_field:false,
  	is_editable:true,
  	creator:'source'
  	})

CREATE (et_instance_of)-[:target_concept]->(meditation_type),
(et_instance_of)-[:source_concept]->(meditation_instance),
(et_perceived)-[:target_concept]->(experience),
(et_perceived)-[:source_concept]->(meditation_instance),
(et_best_maps_to)-[:target_concept]->(perception),
(et_best_maps_to)-[:source_concept]->(experience)

CREATE (met_display_name)<-[:approved_qualia]-(meditation_type),
(mei_display_name)<-[:approved_qualia]-(meditation_instance),
(mei_duration_of_meditation)<-[:approved_qualia]-(meditation_instance),
(mei_start_time)<-[:approved_qualia]-(meditation_instance),
(mei_finish_time)<-[:approved_qualia]-(meditation_instance),
(mei_focus)<-[:approved_qualia]-(meditation_instance),
(mei_date_of_meditation)<-[:approved_qualia]-(meditation_instance),
(mei_notes)<-[:approved_qualia]-(meditation_instance),
(exp_display_name)<-[:approved_qualia]-(experience),
(exp_utc_timestamp_of_experience)<-[:approved_qualia]-(experience),
(exp_time_on_timere)<-[:approved_qualia]-(experience),
(per_display_name)<-[:approved_qualia]-(perception);
