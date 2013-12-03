<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
	<Gesture_set>
					
		<!-- when "point_number" is set to zero, the number of points is limited by range -->
		<Gesture id="1-to-2-finger-drag" type="drag">
			<comment></comment>
			<match>
				<action>
					<initial>
						<cluster point_number="0" point_number_min="1" point_number_max="2"/>
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
		
		<!-- when "point_number" is not zero, the number of points must be equal to the set value -->
		<Gesture id="3-finger-drag" type="drag">
			<comment></comment>
			<match>
				<action>
					<initial>
						<cluster point_number="3" point_number_min="1" point_number_max="10"/>
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