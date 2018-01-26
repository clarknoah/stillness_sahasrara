//Encapsulate Concept Creation
	CREATE (concept:Concept {
						label_name:'Concept',
						display_name:'Concept',
						description:'Concept'
						})

	CREATE (atman:Concept {
						label_name:'Atman',
						display_name:'Atman',
						description:'User Concept'
						})


	CREATE (qualia:Concept {
						label_name:'Qualia',
						display_name:'Qualia',
						description:'Qualia'
						})

	CREATE (entanglement:Concept {
						label_name:'Entanglement',
						display_name:'Entanglement',
						description:'Entanglement'
						})



//Display Names


	CREATE (atman_display_name:Qualia{
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


	CREATE (s_label_name:Qualia{
						db_key:'label_name',
						display_name:'Label Name',
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


CREATE (s_display_name:Qualia{
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


	CREATE (s_description:Qualia{
						db_key:'description',
						display_name:'Node Description',
						is_editable:true,
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
						is_editable:true,
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
						is_editable:true,
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
						is_editable:true,
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

	CREATE (p_is_editable:Qualia{
						db_key:'is_editable',
						display_name:'Editable?',
						is_editable:true,
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
						is_editable:true,
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
						is_editable:true,
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
						is_editable:true,
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
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:7,
						data_type:'number',
						default_value:null
						})

	CREATE (p_data_type:Qualia{
						db_key:'data_type',
						display_name:'Data Type',
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:true,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:['text','textarea','number','date','boolean','text-array','text_select'],
						field_order:8,
						data_type:'text',
						default_value:'text'
						})

	CREATE (p_default_value:Qualia{
						db_key:'default_value',
						display_name:'Default Value',
						is_editable:true,
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

//Atman Qualias

	CREATE (atman_first_name:Qualia{
						db_key:'first_name',
						display_name:'First Name',
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'text',
						default_value:null
						})


	CREATE (atman_last_name:Qualia{
						db_key:'last_name',
						display_name:'last Name',
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'text',
						default_value:null
						})

	CREATE (atman_username:Qualia{
						db_key:'username',
						display_name:'Username',
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'text',
						default_value:null
						})

	CREATE (atman_password:Qualia{
						db_key:'password',
						display_name:'Password (TEST ONLY)',
						is_editable:true,
						mandatory_field:true,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'text',
						default_value:null
						})

	CREATE (atman_birth_date:Qualia{
						db_key:'birth_date',
						display_name:'Birth Date',
						is_editable:true,
						mandatory_field:false,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'date',
						default_value:null
						})

	CREATE (atman_sex:Qualia{
						db_key:'birth_sex',
						display_name:'Birth Sex',
						is_editable:true,
						mandatory_field:false,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:['Male','Female','Other'],
						field_order:4,
						data_type:'text_select',
						default_value:null
						})

	CREATE (atman_height:Qualia{
						db_key:'height',
						display_name:'Current Height (cm)',
						is_editable:true,
						mandatory_field:false,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'number',
						default_value:null
						})

	CREATE (atman_weight:Qualia{
						db_key:'weight',
						display_name:'Current Weight (kg)',
						is_editable:true,
						mandatory_field:false,
						has_multiple_values:false,
						hint:'',
						placeholder:'',
						eq_type:'qualia',
						select_options:[],
						field_order:4,
						data_type:'number',
						default_value:null
						})

//Entanglement
	CREATE (ent_mandatory_field:Qualia{
						db_key:'mandatory_field',
						display_name:'Mandatory Field?',
						is_editable:true,
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

	CREATE (e_is_editable:Qualia{
						db_key:'is_editable',
						display_name:'Is Editable?',
						is_editable:true,
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

	CREATE (e_db_type:Qualia{
			db_key:'db_type',
			display_name:'Entanglement Type',
			is_editable:true,
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
			is_editable:true,
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
			is_editable:true,
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
			is_editable:true,
			mandatory_field:true,
			has_multiple_values:false,
			hint:'Select which Concept should be responsible to make this Entanglement',
			placeholder:'',
			eq_type:'qualia',
			select_options:['source','target','both','independent'],
			field_order:1,
			data_type:'text_select',
			default_value:'null'
			})

//Encapsulates Entanglement Concepts


	CREATE (et_source:Entanglement{
		db_type:'source_concept',
		mandatory_field:true,
		display_name:'Source Concept',
		cardinality:'one-to-one',
		is_editable:true,
		creator:'source'
		})

CREATE (et_target:Entanglement{
			db_type:'target_concept',
			mandatory_field:true,
			display_name:'Target Concept',
			is_editable:true,
			cardinality:'one-to-one',
			creator:'source'
			})

			CREATE (et_approved_qualia:Entanglement{
				db_type:'approved_qualia',
				mandatory_field:true,
				display_name:'Approved Qualia',
				is_editable:false,
				cardinality:'one-to-one',
				creator:'target'
				})


//Encapsulate Entanglements Assignments


	CREATE
	(entanglement)<-[:source_concept]-(et_source),
	(concept)<-[:target_concept]-(et_source),
	(concept)<-[:source_concept]-(et_approved_qualia),
	(qualia)<-[:target_concept]-(et_approved_qualia),
	(entanglement)<-[:source_concept]-(et_target),
	(concept)<-[:target_concept]-(et_target)

	CREATE (p_db_key)<-[:approved_qualia]-(qualia),
		(p_display_name)<-[:approved_qualia]-(qualia),
		(p_is_editable)<-[:approved_qualia]-(qualia),
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
		(atman_display_name)<-[:approved_qualia]-(atman),
		(atman_first_name)<-[:approved_qualia]-(atman),
		(atman_last_name)<-[:approved_qualia]-(atman),
		(atman_username)<-[:approved_qualia]-(atman),
		(atman_password)<-[:approved_qualia]-(atman),
		(atman_birth_date)<-[:approved_qualia]-(atman),
		(atman_sex)<-[:approved_qualia]-(atman),
		(atman_height)<-[:approved_qualia]-(atman),
		(atman_weight)<-[:approved_qualia]-(atman),
		(ent_mandatory_field)<-[:approved_qualia]-(entanglement),
		(e_db_type)<-[:approved_qualia]-(entanglement),
		(e_display_name)<-[:approved_qualia]-(entanglement),
		(e_cardinality)<-[:approved_qualia]-(entanglement),
		(e_is_editable)<-[:approved_qualia]-(entanglement),
		(e_creator)<-[:approved_qualia]-(entanglement);
