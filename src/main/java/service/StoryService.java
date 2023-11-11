package service;

import model.Story;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.StoryRepository;

import java.util.List;

@Service
public class StoryService {
    @Autowired
    private StoryRepository storyRepository;

    public List<Story> getAllStories() {
        return storyRepository.findAll();
    }

    public Story getStoryById(Long id) {
        return storyRepository.findById(id).orElse(null);
    }

    public Story createStory(Story story) {
        return storyRepository.save(story);
    }

    public Story updateStory(Long id, Story updatedStory) {
        Story existingStory = storyRepository.findById(id).orElse(null);
        if (existingStory != null) {
            existingStory.setTitle(updatedStory.getTitle());
            existingStory.setContent(updatedStory.getContent());
            return storyRepository.save(existingStory);
        }
        return null;
    }

    public void deleteStory(Long id) {
        storyRepository.deleteById(id);
    }
}
