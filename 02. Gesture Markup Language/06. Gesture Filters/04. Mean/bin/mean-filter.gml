<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
	<Gesture_set>
	
	<!-- rotate without mean filter -->
	<Gesture id="rotate" type="rotate">			
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
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event type="rotate">
						<property ref="rotate_dtheta" target="rotate"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
	<!-- rotate with mean filter -->
	<Gesture id="rotate-mean" type="rotate">			
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
				<mean_filter>
					<property ref="rotate_dtheta" active="true" frames="6"/>
				</mean_filter>
			</processing>			
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event type="rotate">
						<property ref="rotate_dtheta" target="rotate"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>		
					
		<!-- horizontal drag -->
		<Gesture id="x-drag" type="drag">
			<comment></comment>
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
					</returns>
				</algorithm>
			</analysis>	
			<mapping>
				<update dispatch_type="continuous">
					<gesture_event type="drag">
						<property ref="drag_dx" target="x"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>	
							
	</Gesture_set>				
</GestureMarkupLanguage>