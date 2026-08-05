# Roadmap: Session Management Improvements for Cumann Mhúscraí BBS

**Document Version:** 1.0
**Project:** Cumann Mhúscraí BBS
**Status:** Proposed
**Priority:** High

---

# Background

Testing of the first permanent Raspberry Pi deployment identified an important usability issue.

The BBS maintains a user's session indefinitely. If a user leaves the BBS and returns hours or days later, the software assumes they are still within the previous menu or workflow.

This behaviour is technically correct but produces a poor user experience because users naturally expect a new interaction to begin with the main menu.

The issue does **not** affect the reliability of the BBS or the Meshtastic interface. It is purely a session management issue.

---

# Objectives

Improve the usability of the BBS while preserving the existing menu-driven interface.

The new session manager should:

* Automatically expire inactive sessions.
* Allow users to immediately recover to the main menu.
* Prevent users becoming trapped inside abandoned workflows.
* Maintain compatibility with the existing command handlers.

---

# Phase 1 – Session Timeout

## Objective

Automatically remove inactive user sessions after a configurable period.

### Proposed Default

```
20 minutes
```

### Behaviour

When a session has been inactive longer than the configured timeout:

* Delete the stored session.
* Discard any partially completed workflow.
* Treat the next received message as a completely new interaction.

Example:

```
20:00
User enters Bulletin menu.

20:03
User stops using the BBS.

22:15
User sends "?"

Current behaviour:
Still expects Bulletin menu input.

New behaviour:
Previous session has expired.
Display Main Menu.
```

---

# Phase 2 – Universal Recovery Commands

Certain commands should always override session state.

These commands should work regardless of the current menu.

## Commands

```
?
HELP
MENU
X
```

Behaviour:

```
Reset session state

↓

Return Main Menu

↓

Await new command
```

These commands should bypass all menu logic.

---

# Phase 3 – Session Expiry Notification

Optionally inform the user that the previous session expired.

Example:

```
Previous session expired due to inactivity.

🍀 Cumann Mhúscraí BBS 🍀

[Q]uick Commands
[B]BS
[U]tilities
[X]Exit
```

This avoids confusion if the user expected to resume a previous workflow.

---

# Phase 4 – Configuration

Move timeout values into configuration.

Example:

```ini
[session]

timeout_minutes = 20
```

Future deployments may choose different timeout values.

---

# Phase 5 – Automatic Session Cleanup

Rather than checking only when a message arrives, periodically remove expired sessions.

Benefits:

* Keeps memory usage predictable.
* Prevents abandoned sessions accumulating.
* Simplifies future session statistics.

---

# Phase 6 – Logging

Add session lifecycle logging.

Example:

```
Session created
Session updated
Session expired
Session reset
Session deleted
```

This will simplify troubleshooting.

---

# Phase 7 – Future Enhancements

Possible future improvements include:

* Session persistence across software restarts (optional).
* Configurable timeout per menu type.
* Display remaining session lifetime (admin diagnostics).
* Administrative session monitoring.
* Maximum concurrent session limits.

These are considered lower priority.

---

# Implementation Priority

## Sprint 1

* Session timeout.
* Universal recovery commands.
* Configurable timeout.

## Sprint 2

* Automatic cleanup.
* Improved logging.

## Sprint 3

* Optional user notification.
* Additional diagnostics.

---

# Expected Benefits

* More intuitive user experience.
* Elimination of stale menu state.
* Reduced user confusion.
* Simpler support and troubleshooting.
* Improved long-term reliability for unattended deployments.

---

# Conclusion

The permanent deployment on the Raspberry Pi demonstrated that the BBS transport layer, Meshtastic integration, and system service are operating correctly. The primary usability issue identified is indefinite session persistence.

Implementing automatic session expiration together with universal recovery commands will make Cumann Mhúscraí BBS behave more naturally while preserving its existing architecture. These improvements should be treated as a high-priority enhancement before additional user-facing features are introduced.
