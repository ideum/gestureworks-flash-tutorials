<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<!-- assigned to parent only -->
	<Gesture id="n-drag" type="drag">
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
	
	<Gesture id="n-tap" type="tap">
		<match>
			<action>
				<initial>
					<point event_duration_max="10" translation_max="10"/>
					<cluster point_number="0" point_number_min="1" point_number_max="10"/>
					<event touch_event="gwTouchEnd"/>
				</initial>
			</action>
		</match>	
		<analysis>
			<algorithm class="temporalmetric" type="discrete">
				<library module="tap"/>
				<returns>
					<property id="tap_x" result="x"/>
					<property id="tap_y" result="y"/>
					<property id="tap_n" result="n"/>
				</returns>
			</algorithm>
		</analysis>	
		<mapping>
			<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="10">
				<gesture_event  type="tap">
					<property ref="tap_x"/>
					<property ref="tap_y"/>
					<property ref="tap_n"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
					
</Gesture_set>				
</GestureMarkupLanguage>