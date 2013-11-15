<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="n-drag-boundary" type="drag">
		<match>
			<action>
				<initial>
					<cluster point_number="0" point_number_min="1" point_number_max="10"/>
				</initial>
			</action>
		</match>
		<analysis>
			<algorithm class="kinemetric" type="continuous">
				<library module="drag"/>
				<returns>
					<property id="drag_dx" result="dx"/>
					<property id="drag_dy" result="dy"/>
				</returns>
			</algorithm>
		</analysis>	
		<processing>
			<boundary_filter>
				<property ref="drag_dx" active="true" boundary_min="100" boundary_max="1180"/>
				<property ref="drag_dy" active="true" boundary_min="100" boundary_max="620"/>
			</boundary_filter>
		</processing>												
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="drag">
					<property ref="drag_dx" target="x" min="0" max="1200" />
					<property ref="drag_dy" target="y" min="0" max="680" />
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
	
	<Gesture id="n-scale-boundary" type="scale">		
		<match>
			<action>
				<initial>
					<cluster point_number="0" point_number_min="2" point_number_max="10"/>
				</initial>
			</action>
		</match>
		<analysis>
			<algorithm class="kinemetric" type="continuous">
				<library module="scale"/>
				<returns>
					<property id="scale_dsx" result="ds"/>
					<property id="scale_dsy" result="ds"/>
				</returns>
			</algorithm>
		</analysis>	
		<processing>
			<boundary_filter>
				<property ref="scale_dsx" active="true" boundary_min="1" boundary_max="1.5"/>
				<property ref="scale_dsy" active="true" boundary_min="1" boundary_max="1.5"/>
			</boundary_filter>
		</processing>		
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="scale">
					<property ref="scale_dsx" target="scaleX" min="1" max="1.5"/>
					<property ref="scale_dsy" target="scaleY" min="1" max="1.5"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>	
					
</Gesture_set>				
</GestureMarkupLanguage>