<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>			
				
	<Gesture id="my-2-finger-h-drag" type="drag">
		<match>
			<action>
				<initial>
					<cluster point_number="2"/>
				</initial>
			</action>
		</match>
		<analysis>
			<algorithm class="kinemetric" type="continuous">
				<library module="drag"/>
				<returns>
					<property id="drag_dx" result="dx"/>
				</returns>
			</algorithm>
		</analysis>												
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="custom">
					<property ref="drag_dx" target="x"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>	

</Gesture_set>					
</GestureMarkupLanguage>