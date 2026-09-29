---
marp: true
theme: default
paginate: true
---

# Campus Event Planner

### Project Proposal

### Xander Murphy & Joseph Gallucci

---

# The Problem

College students often manage:

* Classes
* Assignments
* Club meetings
* Campus events
* Personal activities

Information can be spread across multiple apps and calendars.

**Our goal:** Put everything in one simple planner.

---

# Proposed Solution

## Campus Event Planner

A mobile app that lets students:

* Create and manage events
* Organize events by category
* View upcoming activities
* Search and filter events
* Track completed events

Designed to be **simple, fast, and easy to use.**

---

# Intended Users

### Primary Users

**College & university students**

Especially students who:

* Participate in clubs
* Have busy class schedules
* Attend campus events
* Want better organization

---

# Major Features

* 📅 **Calendar & Event List**
* ➕ **Create Events**
* ✏️ **Edit & Delete Events**
* 🔎 **Search & Filter**
* 🏷️ **Event Categories**
* 📍 **Location & Description**
* ✅ **Completed Events**
* 💾 **Local Data Storage**

### Future

🔔 Event reminders & notifications

---

# UI Design

### Home Screen

```text
┌─────────────────────────┐
│  Campus Event Planner   │
├─────────────────────────┤
│  Upcoming Events        │
│                         │
│   Database Class        │
│  Sept. 15 • 10:00 AM    │
│                         │
│   Club Meeting          │
│  Sept. 16 • 4:00 PM     │
│                    [+]  │
└─────────────────────────┘
```

**Navigation:**
Home | Calendar | Events | Settings

---

# Technology

### Development

* **Flutter**
* **Dart**
* Android Studio / VS Code

### Collaboration

* **Git & GitHub**

### Data

* Local storage
**No backend or external API required**

---

# Flutter & Dart

### Flutter

Used for:

* User interface
* Navigation
* Forms
* Lists
* Calendar
* Buttons & interactions

---

# Flutter & Dart

### Dart

Used for:

* Application logic
* Event models
* Searching & filtering
* State management
* Data handling

---

# Development Methodology & Testing

### Process

* **Agile-style workflow** with weekly check-ins
* Work tracked using **GitHub Issues / Projects board**
* Feature work done in branches, merged via **pull requests**
* Short, frequent commits over long ones

### Testing Strategy

* **Manual testing** of each feature as it's built (CRUD, search, filters)
* Basic **unit tests** for event model logic (add/edit/delete/search)
* Device testing on Android emulator + potentially one physical device

---

# Risks & Technical Challenges

| Risk | Mitigation |
|---|---|
| Search/filter performance with large event lists | Test early with sample datasets; optimize queries |
| UI complexity across multiple screens | Build core screens first, polish later |
| Limited Flutter/Dart experience | Allocate early weeks to tutorials & small prototypes |
| Merge conflicts with 2 developers | Clear branch naming, small frequent PRs, regular syncs |

---

# Team Responsibilities

### Xander Murphy

* UI/UX design & navigation
* Calendar & event list screens
* Event creation/edit forms

### Joseph Gallucci

* Event data model
* Local storage implementation
* Search & filtering logic


---

# Development Plan

### 1. Plan — *Weeks 1–2*

Requirements, UI design, GitHub setup

### 2. Build — *Weeks 3–5*

Screens, navigation, event model

### 3. Features — *Weeks 6–9*

CRUD, categories, search & filtering

---

# Development Plan (continued)

### 4. Storage — *Weeks 10–11*

Implement local data storage

### 5. Test — *Weeks 12–13*

Bug fixes, UI polish, Android testing

### 6. Finalize — *Weeks 14–15*

Documentation & presentation

---

# Project Goal

## One simple place for students to manage their campus life.

**Campus Event Planner**

> Flutter • Dart • Android • Simple • Organized