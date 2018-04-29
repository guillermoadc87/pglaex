from slackclient import SlackClient

slack_token = 'xoxp-172936911764-173706954439-264515109349-6197e1c0f0a917f5259c4b176ce3b254'
slack = SlackClient(slack_token)

# Slack API

def create_channel_with(name):
    reponse = slack.api_call('channels.create', name=name)

    if not reponse['ok']:
        return None

    return reponse['channel']['id']

def invite_user(user, channel_id):
    if user.profile.slack_id:
        reponse = slack.api_call('channels.invite', channel=channel_id, user=user.profile.slack_id)
    #else:
    #    reponse = slack.api_call('users.admin.invite',
    #                             email=user.email,
    #                             first_name=user.first_name,
    #                             last_name=user.last_name,
    #                             channels=[channel_id])
        if not reponse['ok']:
            return False

    return True