class Note{
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({ required this.id, required this.content, required this.title, required this.modifiedTime});
}

List<Note> sampleNotes = [
  Note(
    id: 0,
    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", title: "Like & Subscribe", modifiedTime: DateTime(2023, 1, 1 ,34, 5)),

    Note(
    id: 1,
    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", title: "Devhubspot Content", modifiedTime: DateTime(2023, 1, 1 ,34, 5)),
    Note(
    id: 2,
    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", title: "Books Read", modifiedTime: DateTime(2023, 1, 1 ,34, 5)),
    Note(
    id: 3,
    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", title: "Home Work", modifiedTime: DateTime(2023, 1, 1 ,34, 5)),
   Note(
    id: 4,
    content: '1. Jewelry box\n2. Cookbook\n3. Scarf\n4. Spa day gift card', title: "Gift ideas for mom", modifiedTime: DateTime(2023, 1, 1 ,34, 5)),
     Note(
        id: 5,
        title: 'Bucket List',
        content:
            '1. Travel to Japan\n2. Learn to play the guitar\n3. Write a novel\n4. Run a marathon\n5. Start a business',
      modifiedTime: DateTime(2023,1,6,13,9),
      ),
        Note(
        id: 6,
        title: 'Little pigs',
        content: "Once upon a time there were three little pigs who set out to seek their fortune.",
      modifiedTime: DateTime(2023,3,7,11,12),
      ),
      Note(
        id: 7,
        title: 'Meeting Notes',
        content:
            'Attendees: John, Mary, David\nAgenda:\n- Budget review\n- Project updates\n- Upcoming events',
        modifiedTime: DateTime(2023,2,1,15,14),
      ),
      Note(
        id: 8,
        title: 'Ideas for Vacation',
        content:
            '1. Visit Grand Canyon\n2. Go on a hot air balloon ride\n3. Try local cuisine\n4. Attend a concert',
        modifiedTime: DateTime(2023,2,1,12,34),
      ),
           Note(
    id: 9,
    title: 'Workout Plan',
    content:
        'Monday:\n- Run 5 miles\n- Yoga class\nTuesday:\n- HIIT circuit training\n- Swimming laps\nWednesday:\n- Rest day\nThursday:\n- Weightlifting\n- Spin class\nFriday:\n- Run 3 miles\n- Pilates class\nSaturday:\n- Hiking\n- Rock climbing',
    modifiedTime: DateTime(2023,5,1,11,6),
  ),
];