<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>			
					
	<Gesture id="n-rotate-to-scale" type="rotate">
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
					<property id="scale_dsx" result="dtheta"/>
					<property id="scale_dsy" result="dtheta"/>
				</returns>
			</algorithm>
		</analysis>
		<processing>
			<multiply_filter>
					<property ref="scale_dsx" active="true" factor="0.01"/>
					<property ref="scale_dsy" active="true" factor="0.01"/>
			</multiply_filter>
		</processing>
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