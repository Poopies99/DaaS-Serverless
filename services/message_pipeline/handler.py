import json

def entrypoint(event, context):
    from libpy.message_pipeline import main
    print("invoking entrypoint...")
    return main.runAutomation(event, context)
