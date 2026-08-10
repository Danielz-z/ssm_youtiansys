# CodeQL Security Triage Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Close the 40 project-owned pagination alerts while preserving and clearly classifying the 39 findings in bundled legacy frontend assets.

**Architecture:** Apply only URL-component encoding at the ten JSP input boundaries. Do not edit bundled libraries; instead, validate their paths against an explicit allowlist and classify their existing alerts consistently in GitHub after the project-code scan is clean.

**Tech Stack:** JSP, JavaScript, Maven, GitHub CodeQL API

## Global Constraints

- Preserve the existing endpoints, query parameter names, pagination functions, and legacy browser behavior.
- Do not upgrade or hand-edit jQuery, H-ui, validation plugins, Spring, Shiro, or other dependencies.
- Only alerts located under the confirmed bundled-library paths may be classified as legacy third-party risk.

---

### Task 1: Encode pagination query values

**Files:**
- Modify: `src/main/webapp/admin/User/find.jsp`
- Modify: `src/main/webapp/admin/SensorType/find.jsp`
- Modify: `src/main/webapp/admin/SensorData/find.jsp`
- Modify: `src/main/webapp/admin/SafetyInfo/find.jsp`
- Modify: `src/main/webapp/admin/Role/find.jsp`
- Modify: `src/main/webapp/admin/OilFieldInfo/find.jsp`
- Modify: `src/main/webapp/admin/Gonggao/find.jsp`
- Modify: `src/main/webapp/admin/DailyAlarms/find.jsp`
- Modify: `src/main/webapp/admin/AramType/find.jsp`
- Modify: `src/main/webapp/admin/AlarmStats/find.jsp`

**Interfaces:**
- Consumes: the existing DOM values from `#field` and `#fieldValue`.
- Produces: the same navigation URLs with both query values encoded by `encodeURIComponent`.

- [ ] **Step 1: Establish the failing regression check**

Run a repository-local shell assertion that enumerates the ten files and fails if any assignment still exactly reads `.value` without `encodeURIComponent`. Record the initial count of 80 unencoded assignments.

- [ ] **Step 2: Apply the minimal edits**

In all four pagination functions in each JSP, change:

```javascript
var field = document.getElementById("field").value;
var fieldValue = document.getElementById("fieldValue").value;
```

to:

```javascript
var field = encodeURIComponent(document.getElementById("field").value);
var fieldValue = encodeURIComponent(document.getElementById("fieldValue").value);
```

- [ ] **Step 3: Verify the regression check passes**

Run the assertion again and require zero unencoded assignments plus exactly 80 encoded assignments across the ten files.

- [ ] **Step 4: Build and inspect scope**

Run `mvn test` and `mvn package -DskipTests`. Verify with `git diff --name-only` that only the ten JSP files changed and no path under `src/main/webapp/common/` changed.

- [ ] **Step 5: Commit the project-code fix**

Run: `git add src/main/webapp/admin/*/find.jsp && git commit -m "fix: encode pagination query parameters"`

### Task 2: Push, rescan, and classify legacy vendor alerts

**Files:**
- No source files modified.
- Remote alert state updated only after path validation.

**Interfaces:**
- Consumes: CodeQL open-alert JSON after the JSP fix reaches `main`.
- Produces: zero open alerts in project-owned JSP files and consistent legacy-risk classification for the 39 bundled-asset alerts.

- [ ] **Step 1: Push and wait for CodeQL**

Push the feature branch, merge it to `main`, push `main`, and wait for the default CodeQL scan to complete.

- [ ] **Step 2: Reconcile project findings**

Fetch all open alerts. Require that no alert path begins with `src/main/webapp/admin/` and that every remaining path belongs to one of the confirmed bundled paths under `src/main/webapp/common/lib/` or `src/main/webapp/common/static/`.

- [ ] **Step 3: Classify confirmed vendor alerts**

For each remaining confirmed vendor alert, dismiss it with reason `won't fix` and the comment: `Legacy bundled frontend dependency; conservative remediation avoids hand-editing vendor code. Track for a future full dependency upgrade.` Do not dismiss an alert if its path is outside the allowlist.

- [ ] **Step 4: Verify final alert state**

Read CodeQL alerts again and require zero open project alerts and zero open confirmed vendor alerts, with all dismissed alerts retaining the classification comment.
