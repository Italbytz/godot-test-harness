# Godot Test Harness (`godot-test-harness`)

> **Godot 4 Addon for Lightweight Headless CI/CD Unit Testing**  
> **Organization:** [Italbytz](https://github.com/Italbytz)  
> **Compatibility:** Godot Engine 4.x (GDScript)

---

## 🚀 Übersicht

`TestHarness` ist ein minimalistisches, CI/CD-freundliches Test-Framework für Godot 4. Es ersetzt wiederkehrende `assert()`-Boilerplate-Skripte durch eine saubere, strukturierte Testrunner-Architektur mit Exit-Codes, Suite-Statistiken und Fehlermeldungen.

### Hauptmerkmale:
- **Headless CLI-Ready:** Führt Tests direkt über das Terminal aus (`godot --headless -s test_suite.gd`).
- **Präzise Assertions:**
  - `assert_true(cond, msg)` / `assert_false(cond, msg)`
  - `assert_eq(actual, expected, msg)` / `assert_ne(actual, expected, msg)`
  - `assert_approx_eq(actual, expected, epsilon, msg)` (Floats)
  - `assert_vector_approx_eq(actual, expected, epsilon, msg)` (Vector2)
  - `assert_not_null(val, msg)` / `assert_null(val, msg)`
  - `assert_gt(val, threshold, msg)` / `assert_lt(val, threshold, msg)`
- **Automatisierte CI/CD Exit-Codes:** Gibt `0` bei Erfolg und `1` bei Fehlschlag zurück.

---

## 📦 Verwendung

Erstelle ein Skript (z. B. `test_gameplay.gd`), das von `GodotTestRunner` erbt:

```gdscript
extends "res://addons/test_harness/test_runner.gd"

func _init() -> void:
    start("My Game Unit Tests")
    
    run_suite("Player Mechanics", _test_player)
    run_suite("Weapon System", _test_weapons)
    
    finish()

func _test_player() -> void:
    var player = Player.new()
    assert_eq(player.health, 100, "Player should start with 100 HP")
    assert_true(player.is_alive(), "Player must be alive")
```

---

## 🧪 CI/CD Ausführung

```bash
/Applications/Godot.app/Contents/MacOS/Godot --headless -s test_gameplay.gd
```

---

## 📄 Lizenz

MIT License – Copyright (c) 2026 [Italbytz](https://github.com/Italbytz)
