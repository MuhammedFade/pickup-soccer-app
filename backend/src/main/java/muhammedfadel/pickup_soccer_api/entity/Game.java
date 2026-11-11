package muhammedfadel.pickup_soccer_api.entity;

import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(name = "games")
public class Game {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "organizer_id", nullable = false)
    private Long organizerId;

    @Column(name = "location", nullable = false)
    private String location;

    @Column(name = "start_at", nullable = false)
    private Instant startAt;

    @Column(name = "max_capacity", nullable = false)
    private Integer maxCapacity;

    public Game() {
    }

    public Game(Long organizerId, String location, Instant startAt, Integer maxCapacity) {
        this.organizerId = organizerId;
        this.location = location;
        this.startAt = startAt;
        this.maxCapacity = maxCapacity;
    }

    public Long getId() {
        return id;
    }

    public Long getOrganizerId() {
        return organizerId;
    }

    public void setOrganizerId(Long organizerId) {
        this.organizerId = organizerId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Instant getStartAt() {
        return startAt;
    }

    public void setStartAt(Instant startAt) {
        this.startAt = startAt;
    }

    public Integer getMaxCapacity() {
        return maxCapacity;
    }

    public void setMaxCapacity(Integer maxCapacity) {
        this.maxCapacity = maxCapacity;
    }

}
