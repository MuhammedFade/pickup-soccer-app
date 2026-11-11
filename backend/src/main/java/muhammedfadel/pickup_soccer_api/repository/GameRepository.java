package muhammedfadel.pickup_soccer_api.repository;

import muhammedfadel.pickup_soccer_api.entity.Game;
import org.springframework.data.jpa.repository.JpaRepository;

   public interface GameRepository extends JpaRepository<Game, Long> {
   }