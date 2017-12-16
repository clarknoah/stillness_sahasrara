START n=node(*) MATCH (n)-[r]-() DELETE r,n;
START n=node(*) MATCH (n) DELETE n;
CREATE (concept:Concept {
					label_name:'Concept',
					description:'Concept',
					number:44
					})


CREATE (qualia:Concept {
					label_name:'Qualia',
					description:'Qualia',
					number:22
					})

CREATE (entanglement:Concept {
					label_name:'Entanglement',
					description:'Entanglement',
					number:42
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
					select_options:['text','textarea','number','date','boolean','text-array'],
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
	(s_number)<-[:approved_qualia]-(concept);
