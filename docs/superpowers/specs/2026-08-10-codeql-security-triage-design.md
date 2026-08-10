# CodeQL Security Triage Design

## Goal

Address project-owned CodeQL findings in `Smart-oilfield-system` conservatively
while preserving the legacy UI stack and explicitly recording residual risk in
vendored frontend code.

## Finding classification

The initial scan reports 79 open alerts:

- 40 alerts are in ten project-owned JSP list pages. Four pagination functions
  per page concatenate DOM-provided search values into a navigation URL without
  encoding.
- 39 alerts are in bundled third-party or framework assets, including jQuery
  1.9.1, jQuery Validation 1.14.0, H-ui 3.1.3, and related plugins.

## Project-code remediation

In each affected JSP page, encode the `field` and `fieldValue` query parameters
with `encodeURIComponent` before constructing the pagination URL. Preserve the
existing endpoints, parameter names, pagination functions, and browser behavior.
No broader JavaScript refactor is included.

Affected modules are the list pages for User, SensorType, SensorData,
SafetyInfo, Role, OilFieldInfo, Gonggao, DailyAlarms, AramType, and AlarmStats.

## Vendored-code handling

Do not hand-edit or partially upgrade bundled libraries. Their alerts will be
classified as legacy third-party risk with a consistent explanation. They will
remain visible unless an alert is explicitly dismissed after confirming its
path belongs to the bundled library/framework set.

This avoids presenting a fragile partial vendor patch as a secure dependency
upgrade. A future full frontend modernization can replace these libraries with
supported versions and retest the UI as a separate project.

## Testing

- Establish a failing regression check that detects unencoded pagination query
  values in the ten JSP pages, then verify it passes after the minimal edits.
- Run the Maven test/package lifecycle available to the repository.
- Inspect the diff to confirm that no bundled library files changed.
- After pushing, wait for CodeQL and verify that the 40 project-owned alerts
  close; reconcile the remaining alert count with the 39 classified vendor
  findings.

## Scope

This work does not upgrade jQuery, H-ui, Spring, Shiro, or other legacy
dependencies, and it does not redesign the JSP pages or backend controllers.
