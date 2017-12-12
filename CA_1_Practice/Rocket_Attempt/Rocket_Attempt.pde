  for(int i = 0; i < rockets.length; i++)
      {
        PVector retCoordinates = new PVector(width/2, height/2);
        PVector startPosition;
        PVector direction;
        float MaximumSpeed = 1;
        if(i % 2 == 0)
        {
          startPosition = new PVector(0, (height/8)*6);
          direction = PVector.sub(retCoordinates, startPosition);
          //direction.normalize();
          direction.mult(MaximumSpeed);
          rockets[i] = new Rocket(startPosition, direction);   
        }
        else if(i % 2 == 1)
        {
          startPosition = new PVector(width, (height/8)*6);
          direction = PVector.sub(retCoordinates, startPosition);
          //direction.normalize();
          direction.mult(MaximumSpeed);
          rockets[i] = new Rocket(startPosition, direction);
        }