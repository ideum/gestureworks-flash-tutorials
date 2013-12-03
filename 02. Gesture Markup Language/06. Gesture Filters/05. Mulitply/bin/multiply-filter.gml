<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
	<Gesture_set>
		
		<Gesture id="rotate-multiply" type="rotate">
			<match>
				<action>
					<initial>
						<cluster point_number="0" point_number_min="2" point_number_max="10"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="kinemetric" type="continuous">
					<library module="rotate"/>
					<returns>
						<property id="rotate_dtheta" result="dtheta"/>
					</returns>
				</algorithm>
			</analysis>	
			<processing>
				<multiply_filter>
					<property ref="rotate_dtheta" active="true" factor="10"/>
				</multiply_filter>				
			</processing>			
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event type="rotate">
						<property ref="rotate_dtheta" target="rotate"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>		
		
	</Gesture_set>				
</GestureMarkupLanguage>