// iAm Concepts
MATCH (atman:Concept)
WHERE atman.label_name = "Atman"

  CREATE (meditation_instance:Concept {
            label_name:'Meditation_Instance',
            display_name:'Meditation_Instance',
            description:'Instance of a Meditation Type'
            })

  CREATE (altered:Concept {
            label_name:'Altered_State_Observer',
            display_name:'Altered State Observer',
            description:'Tracker for Altered States of Consciousness'
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

// Altered_State_Observer

  CREATE (altered_display_name:Qualia{
    db_key:'display_name',
    display_name:'Experiment Title',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:[],
    field_order:1,
    data_type:'text',
    default_value:""
    })

    CREATE (altered_date_of_ingestion:Qualia{
      db_key:'date_of_ingestion',
      display_name:'Ingestion Date',
      is_editable:false,
      mandatory_field:true,
      has_multiple_values:false,
      hint:'',
      placeholder:'',
      eq_type:'qualia',
      select_options:[],
      field_order:1,
      data_type:'date',
      default_value:null
      })

  CREATE (altered_timestamp_of_ingestion:Qualia{
    db_key:'timestamp_of_ingestion',
    display_name:'Ingestion Timestamp',
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

  CREATE (altered_date_of_ingestion:Qualia{
    db_key:'date_of_ingestion',
    display_name:'Ingestion Date',
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

  CREATE (altered_unit_of_measurement:Qualia{
    db_key:'unit_of_measurement',
    display_name:'Measuring Unit',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:['kilograms', 'grams', 'milligrams', 'micrograms', 'pounds', 'milliliter'],
    field_order:1,
    data_type:'text_select',
    default_value:null
    })

  CREATE (altered_substance:Qualia{
    db_key:'substance',
    display_name:'Ingested Substance Type',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:['Amphetamine Salts', 'Psilocybin (pure)', 'Lysergic acid diethylamide (LSD)', 'Ayahuasca', 'Mescaline (pure)',  'N,N-DMT (pure)', '5-MeO-DMT (pure)', 'Psilocybe (dry)','Psilocybe (wet)'],
    field_order:1,
    data_type:'text_select',
    default_value:null
    })

  CREATE (altered_method_of_ingestion:Qualia{
    db_key:'method_of_ingestion',
    display_name:'Ingestion Method',
    is_editable:true,
    mandatory_field:true,
    has_multiple_values:false,
    hint:'',
    placeholder:'',
    eq_type:'qualia',
    select_options:['orally','injected'],
    field_order:1,
    data_type:'text_select',
    default_value:null
    })

  CREATE (altered_dose:Qualia{
    db_key:'dose',
    display_name:'Quantity Ingested',
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

    CREATE (exp_notes:Qualia{
  		db_key:'notes',
  		display_name:'Notes',
  		is_editable:true,
  		mandatory_field:false,
  		has_multiple_values:false,
  		hint:'',
  		placeholder:'',
  		eq_type:'qualia',
  		select_options:[],
  		field_order:1,
  		data_type:'text',
  		default_value:''
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
  	is_editable:false,
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

  CREATE (alt_atm_performed_by:Entanglement{
  	db_type:'performed_by',
  	mandatory_field:true,
  	display_name:'Performed By',
  	cardinality:'one-to-one',
  	is_editable:false,
  	creator:'source'
  	})

  CREATE (inst_atm_performed_by:Entanglement{
  	db_type:'performed_by',
  	mandatory_field:true,
  	display_name:'Performed By',
  	cardinality:'one-to-one',
  	is_editable:false,
  	creator:'source'
  	})

  CREATE (inst_alt_part_of:Entanglement{
  	db_type:'part_of',
  	display_name:'part_of',
  	mandatory_field:true,
  	cardinality:'one-to-one',
  	is_editable:false,
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

CREATE (altered_display_name)<-[:approved_qualia]-(altered),
(altered_timestamp_of_ingestion)<-[:approved_qualia]-(altered),
(altered_date_of_ingestion)<-[:approved_qualia]-(altered),
(altered_unit_of_measurement)<-[:approved_qualia]-(altered),
(altered_substance)<-[:approved_qualia]-(altered),
(altered_method_of_ingestion)<-[:approved_qualia]-(altered),
(altered_dose)<-[:approved_qualia]-(altered)

CREATE (et_instance_of)-[:target_concept]->(meditation_type),
(et_instance_of)-[:source_concept]->(meditation_instance),
(alt_atm_performed_by)-[:source_concept]->(altered),
(alt_atm_performed_by)-[:target_concept]->(atman),
(inst_atm_performed_by)-[:source_concept]->(meditation_instance),
(inst_atm_performed_by)-[:target_concept]->(atman),
(inst_alt_part_of)-[:source_concept]->(meditation_instance),
(inst_alt_part_of)-[:target_concept]->(altered),
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
(exp_time_on_timer)<-[:approved_qualia]-(experience),
(exp_utc_timestamp_of_experience)<-[:approved_qualia]-(experience),
(exp_time_on_timere)<-[:approved_qualia]-(experience),
(per_display_name)<-[:approved_qualia]-(perception);
