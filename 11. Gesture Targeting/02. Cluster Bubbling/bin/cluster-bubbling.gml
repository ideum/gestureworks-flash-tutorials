<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<!-- assigned to parent only -->
	<Gesture id="parent-drag" type="drag">
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
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="drag">
					<property ref="drag_dx" target="x"/>
					<property ref="drag_dy" target="y"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
	
	<!-- assigned to child only -->
	<Gesture id="child-scale" type="scale">
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
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="scale">
					<property ref="scale_dsx" target="scaleX"/>
					<property ref="scale_dsy" target="scaleY"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
					
</Gesture_set>				
</GestureMarkupLanguage>