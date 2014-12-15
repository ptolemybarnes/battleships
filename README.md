#Ships

| Responsibility       | Collaborators |
|----------------------|:-------------:|
| Be hit?              | Players, Board|
| Sink                 | Board         |
| Be placed            | Board, Players|

#Board
possibility: (class Primary Grid << Tracking Grid)

| Responsibility       | Collaborators |
|----------------------|:-------------:|
| Record ship          | Ship          |
| Record shots         | Player        |

#Player

| Responsibility       | Collaborators |
|----------------------|:-------------:|
| Shoot                | Board         |
| Place ship           | Ship, Board   |

#GameHandler

| Responsibility       | Collaborators |
|----------------------|:-------------:|
| Set Board            | Players	   |
| Start game           | Board, Players|
| Decide turn          | Players       |
| Finish game          | Players, Board|
| Save game            | Board         |

