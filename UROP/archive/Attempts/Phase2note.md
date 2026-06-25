# Formal Report Skeleton for the LLM 3x2 Percept Prompt

## Title Page, Abstract, and Front Matter (1-2 pages)
- Title: Prompt Design for 3x2 Positional Percepts in VacuumWorld
- Author, affiliation, date, and project context
- Abstract: A concise summary of the problem, the prompt design approach, and the expected contribution of the 3x2 percept layout
- Keywords: LLM prompt design, perceptual layout, VacuumWorld, agent observation, spatial reasoning

## 1. Introduction (2-3 pages)
### 1.1 Project Background
- Introduce VacuumWorld and the agent-based setting
- Explain why prompt quality matters when using an LLM to support agent decisions
- Describe the need for a compact but expressive local observation window

### 1.2 Problem Statement
- State the problem of converting environment observations into a prompt that an LLM can reliably interpret
- Explain the importance of representing only the most relevant local context
- Identify the risk of inconsistent or ambiguous observation ordering

### 1.3 Report Objectives
- Define the goal of documenting the 3x2 percept layout
- Explain that the report will justify the percept ordering and its use in the prompt
- State that the report will connect implementation details to prompt design decisions

## 2. System and Environment Overview (3-4 pages)
### 2.1 VacuumWorld Overview
- Describe the simulation environment at a high level
- Summarize the agent, the grid, and the interaction between movement and perception
- Explain where the observation system fits into the overall architecture

### 2.2 Agent Observation Model
- Introduce the concept of a local observation slice
- Explain how the agent receives information about neighboring positions
- Describe why a limited field of view is used instead of the full map

### 2.3 3x2 Observation Window
- Define the 3x2 neighborhood around the agent
- Explain how the observation captures the current tile and adjacent positions
- Note that the window can be reduced near boundaries

### 2.4 Why Local Percepts Matter
- Discuss how local percepts support movement decisions
- Explain how walls, boundaries, and nearby space influence behavior
- Emphasize the value of structured spatial input for an LLM

## 3. Observation Layout and Positional Percepts (4-5 pages)
### 3.1 Positional Naming Scheme
- List the six positions used in the observation: center, forward, left, right, forwardleft, forwardright
- Define each position in plain language
- Explain how the naming scheme reduces ambiguity

### 3.2 Spatial Interpretation of Each Percept
- Center: the agent's current location
- Forward: the tile immediately in front of the agent
- Left: the tile directly to the agent's left
- Right: the tile directly to the agent's right
- Forwardleft: the diagonal tile in front-left space
- Forwardright: the diagonal tile in front-right space

### 3.3 Ordering Requirements
- Explain that the percepts must be reported in a consistent order
- Describe why ordering matters for prompt parsing and LLM interpretation
- State that the report follows the observation API order exactly

### 3.4 Boundary Conditions
- Discuss what happens when the observation window touches the edge of the grid
- Explain how missing tiles affect the available percepts
- Clarify why boundary awareness must be represented explicitly in the prompt

## 4. Prompt Design Rationale (4-5 pages)
### 4.1 Prompt Design Goals
- Make the prompt easy for the LLM to read
- Preserve the exact observation structure in natural language
- Avoid unnecessary information that could distract from the action decision

### 4.2 Converting Percepts into Text
- Explain how each positional percept is translated into a readable description
- Discuss the balance between structure and readability
- Note the importance of stable wording across turns

### 4.3 Context Framing
- Describe how the prompt should frame the agent's current state
- Explain how the model is told what the observation means
- Clarify what information the LLM should use when choosing an action

### 4.4 Safety and Reliability Considerations
- Discuss how consistent prompt structure reduces interpretation errors
- Explain why a prompt should not rely on implied ordering
- Note the value of keeping the input format close to the implementation

## 5. Implementation Review: UROP/3x2percept.py (4-5 pages)
### 5.1 File Purpose
- State that this file demonstrates how the 3x2 percept information is extracted
- Explain that it serves as a concrete reference for prompt construction

### 5.2 Observation Extraction Logic
- Describe how the code reads the current orientation and latest observation
- Explain how the neighboring tiles are accessed
- Note the handling of wall and boundary checks

### 5.3 Percept Generation Logic
- Explain how the percept string is constructed
- Show how the current orientation and previous action context are added
- Describe how the code reports whether walls are present around the agent

### 5.4 Relationship to the Prompt
- Explain how the implementation influenced the written note
- Show why the prompt should match the code's observation order
- State that the note is intended to preserve implementation fidelity

## 6. Methodology for Prompt Construction (3-4 pages)
### 6.1 Step-by-Step Process
- Identify the observation fields to include
- Map each field to a natural-language description
- Verify that the final prompt preserves the same sequence as the code

### 6.2 Validation Strategy
- Check the prompt against the source implementation
- Confirm that all six percepts are represented
- Ensure that the wording is consistent and unambiguous

### 6.3 Iteration and Refinement
- Describe how the first version of the prompt can be revised
- Note what kinds of ambiguities should be removed during refinement
- Explain how future prompt versions can become more concise without losing meaning

## 7. Expected Use in LLM Decision-Making (2-3 pages)
### 7.1 Intended Role of the Prompt
- Explain that the prompt is meant to support action selection
- Describe how the LLM uses the observation to infer safe or useful moves
- Connect the prompt to downstream agent behavior

### 7.2 Anticipated Benefits
- Better spatial awareness for the model
- Improved consistency in interpreting the grid
- More reliable decision-making in local navigation tasks

### 7.3 Anticipated Limitations
- The model only sees a local slice of the environment
- The prompt may not capture long-range planning
- Boundary cases may still require careful handling

## 8. Discussion (2-3 pages)
### 8.1 Why the 3x2 Layout Is Useful
- Discuss the tradeoff between simplicity and spatial coverage
- Explain why a compact observation is appropriate for the task

### 8.2 Observations About Prompt Quality
- Reflect on how structure affects model understanding
- Discuss whether the wording is direct enough for reliable use
- Note any cases where the model could still misread the layout

### 8.3 Broader Implications
- Explain how this approach could generalize to other agent systems
- Discuss the value of aligning prompts with code-level data structures

## 9. Future Work (1-2 pages)
### 9.1 Prompt Improvements
- Add clearer examples of each percept position
- Explore shorter or more formal prompt variants
- Test alternate phrasing for better model performance

### 9.2 System Extensions
- Expand the observation summary to include richer state information
- Compare the 3x2 layout with other observation sizes
- Evaluate whether different prompt formats improve action quality

## 10. Conclusion (1 page)
- Restate the problem and the purpose of the 3x2 percept prompt
- Summarize the importance of matching the observation API order
- Conclude with the main value of translating the implementation into a clear report-ready description

## References (as needed)
- VacuumWorld source files
- Relevant documentation for observation and action APIs
- Any external background sources used in the report

## Appendix (optional, 2-4 pages)
### A. Annotated Code Excerpt
- Include the relevant section from UROP/3x2percept.py
- Annotate how each percept is extracted and described

### B. Example Prompt Drafts
- Show one or two candidate prompt formulations
- Compare concise versus detailed versions

### C. Testing Notes
- Record any observations about how the LLM responds to the prompt
- Note whether the ordering of percepts affects output consistency

## Suggested Page Budget Summary
- Front matter: 1-2 pages
- Introduction: 2-3 pages
- System and environment overview: 3-4 pages
- Observation layout and positional percepts: 4-5 pages
- Prompt design rationale: 4-5 pages
- Implementation review: 4-5 pages
- Methodology: 3-4 pages
- Expected use in LLM decision-making: 2-3 pages
- Discussion: 2-3 pages
- Future work: 1-2 pages
- Conclusion: 1 page
- References and appendix: remaining pages as needed to reach approximately 30 pages
