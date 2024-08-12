import json
from supabase import create_client, Client

# Initialize the Supabase client
url: str = "your_supabase_url"  # Replace with your Supabase project URL
key: str = "your_supabase_anon_key"  # Replace with your Supabase anon key
supabase: Client = create_client(url, key)

def insert_player(player_data):
    response = supabase.table('players').insert(player_data).execute()
    return response

def insert_combine_test_report(report_data):
    response = supabase.table('combine_test_reports').insert(report_data).execute()
    return response

def insert_stroke(stroke_data):
    response = supabase.table('strokes').insert(stroke_data).execute()
    return response

def insert_measurement(measurement_data):
    response = supabase.table('measurements').insert(measurement_data).execute()
    return response

def process_json(json_file):
    with open(json_file, 'r') as file:
        data = json.load(file)
    
    for stroke_group in data['StrokeGroups']:
        player = stroke_group['Player']
        player_data = {
            "id": player['Id'],
            "name": player['Name'],
            "email": player['Email'],
            "hcp": player['Hcp'],
            "gender": player['Gender'],
            "nationality": player['Nationality'],
            "birthday": player['Birthday'],
            "mailchimp": player['Properties'].get('MailChimp')
        }
        
        insert_player(player_data)
        
        combine_test_report_data = {
            "id": stroke_group['Id'],
            "date": stroke_group['Date'],
            "target": stroke_group['Target'],
            "avg_score": stroke_group['AvgScore'],
            "avg_distance_from_pin": stroke_group['AvgDistanceFromPin'],
            "player_id": player['Id']
        }
        
        insert_combine_test_report(combine_test_report_data)
        
        for stroke in stroke_group['Strokes']:
            stroke_data = {
                "id": stroke['Id'],
                "time": stroke['Time'],
                "club": stroke['Club'],
                "ball": stroke['Ball'],
                "combine_test_report_id": stroke_group['Id'],
                "score": stroke['Measurement']['Score'],
                "distance_from_pin": stroke['Measurement']['DistanceFromPin']
            }
            
            insert_stroke(stroke_data)
            
            measurement_data = {
                "id": stroke['Measurement']['Id'],
                "stroke_id": stroke['Id'],
                "tee_position_x": stroke['Measurement']['TeePosition'][0],
                "tee_position_y": stroke['Measurement']['TeePosition'][1],
                "tee_position_z": stroke['Measurement']['TeePosition'][2],
                "player_dexterity": stroke['Measurement']['PlayerDexterity'],
                "dynamic_lie": stroke['Measurement']['DynamicLie'],
                "impact_offset": stroke['Measurement']['ImpactOffset'],
                "impact_height": stroke['Measurement']['ImpactHeight'],
                "attack_angle": stroke['Measurement']['AttackAngle'],
                "launch_direction": stroke['Measurement']['LaunchDirection'],
                "ball_speed": stroke['Measurement']['BallSpeed'],
                "club_path": stroke['Measurement']['ClubPath'],
                "club_speed": stroke['Measurement']['ClubSpeed'],
                "dynamic_loft": stroke['Measurement']['DynamicLoft'],
                "face_angle": stroke['Measurement']['FaceAngle'],
                "face_to_path": stroke['Measurement']['FaceToPath'],
                "launch_angle": stroke['Measurement']['LaunchAngle'],
                "smash_factor": stroke['Measurement']['SmashFactor'],
                "spin_axis": stroke['Measurement']['SpinAxis'],
                "spin_loft": stroke['Measurement']['SpinLoft'],
                "spin_rate": stroke['Measurement']['SpinRate'],
                "swing_direction": stroke['Measurement']['SwingDirection'],
                "swing_plane": stroke['Measurement']['SwingPlane'],
                "swing_radius": stroke['Measurement']['SwingRadius'],
                "dplane_tilt": stroke['Measurement']['DPlaneTilt'],
                "low_point_distance": stroke['Measurement']['LowPointDistance'],
                "low_point_height": stroke['Measurement']['LowPointHeight'],
                "low_point_side": stroke['Measurement']['LowPointSide'],
                "max_height": stroke['Measurement']['MaxHeight'],
                "carry": stroke['Measurement']['Carry'],
                "total": stroke['Measurement']['Total'],
                "carry_side": stroke['Measurement']['CarrySide'],
                "total_side": stroke['Measurement']['TotalSide'],
                "landing_angle": stroke['Measurement']['LandingAngle'],
                "hang_time": stroke['Measurement']['HangTime'],
                "last_data": stroke['Measurement']['LastData'],
                "curve": stroke['Measurement']['Curve'],
                "reduced_accuracy": ','.join(stroke['Measurement'].get('ReducedAccuracy', [])),
                "ball_trajectory": stroke['Measurement']['BallTrajectory'],
                "club_trajectory": stroke['Measurement']['ClubTrajectory'],
            }
            
            insert_measurement(measurement_data)

# Process the JSON file and insert data
process_json('report.json')  # Replace 'report.json' with the path to your JSON file
