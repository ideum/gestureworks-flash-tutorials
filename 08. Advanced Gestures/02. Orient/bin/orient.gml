<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
	<Gesture_set>
					
		<Gesture id="orient" type="orient">
			<match>
				<action>
					<initial>
						<cluster point_number="5"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="kinemetric" type="continuous">
					<library module="orient"/>
					<returns>
						<property id="orient_dx" result="orient_dx"/>
						<property id="orient_dy" result="orient_dy"/>						
						<property id="orient_thumbID" result="thumbID"/>
					</returns>
				</algorithm>
			</analysis>	
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event type="orient">
						<property ref="orient_dx"/>
						<property ref="orient_dy"/>
						<property ref="orient_thumbID"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
				
	</Gesture_set>					
</GestureMarkupLanguage>