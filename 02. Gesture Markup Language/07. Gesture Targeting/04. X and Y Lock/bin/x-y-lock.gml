<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="manipulate" type="manipulate">
		<match>
			<action>
				<initial>
					<cluster point_number="0" point_number_min="1" point_number_max="10"/>
				</initial>
			</action>
		</match>	
		<analysis>
			<algorithm class="kinemetric" type="continuous">
				<library module="manipulate"/>
				<returns>
					<property id="dx" result="dx"/>
					<property id="dy" result="dy"/>
					<property id="dsx" result="ds"/>
					<property id="dsy" result="ds"/>
					<property id="dtheta" result="dtheta"/>
				</returns>
			</algorithm>
		</analysis>	
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event  type="manipulate">
					<property ref="dx" target="x"/>
					<property ref="dy" target="y"/>
					<property ref="dsx" target="scaleX"/>
					<property ref="dsy" target="scaleY"/>
					<property ref="dtheta" target="rotation"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
	
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
			
</Gesture_set>					
</GestureMarkupLanguage>