<?php

/**
 * This code was generated by
 * ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
 *  |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
 *  |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
 *
 * Twilio - Messaging
 * This is the public Twilio REST API.
 *
 * NOTE: This class is auto generated by OpenAPI Generator.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


namespace Twilio\Rest\Messaging\V1\Service;

use Twilio\Exceptions\TwilioException;
use Twilio\InstanceResource;
use Twilio\Values;
use Twilio\Version;
use Twilio\Deserialize;


/**
 * @property string|null $sid
 * @property string|null $accountSid
 * @property string|null $brandRegistrationSid
 * @property string|null $messagingServiceSid
 * @property string|null $description
 * @property string[]|null $messageSamples
 * @property string|null $usAppToPersonUsecase
 * @property bool|null $hasEmbeddedLinks
 * @property bool|null $hasEmbeddedPhone
 * @property bool|null $subscriberOptIn
 * @property bool|null $ageGated
 * @property bool|null $directLending
 * @property string|null $campaignStatus
 * @property string|null $campaignId
 * @property bool|null $isExternallyRegistered
 * @property array|null $rateLimits
 * @property string|null $messageFlow
 * @property string|null $optInMessage
 * @property string|null $optOutMessage
 * @property string|null $helpMessage
 * @property string[]|null $optInKeywords
 * @property string[]|null $optOutKeywords
 * @property string[]|null $helpKeywords
 * @property \DateTime|null $dateCreated
 * @property \DateTime|null $dateUpdated
 * @property string|null $url
 * @property bool|null $mock
 * @property array[]|null $errors
 */
class UsAppToPersonInstance extends InstanceResource
{
    /**
     * Initialize the UsAppToPersonInstance
     *
     * @param Version $version Version that contains the resource
     * @param mixed[] $payload The response payload
     * @param string $messagingServiceSid The SID of the [Messaging Service](https://www.twilio.com/docs/messaging/api/service-resource) to create the resources from.
     * @param string $sid The SID of the US A2P Compliance resource to delete `QE2c6890da8086d771620e9b13fadeba0b`.
     */
    public function __construct(Version $version, array $payload, string $messagingServiceSid, string $sid = null)
    {
        parent::__construct($version);

        // Marshaled Properties
        $this->properties = [
            'sid' => Values::array_get($payload, 'sid'),
            'accountSid' => Values::array_get($payload, 'account_sid'),
            'brandRegistrationSid' => Values::array_get($payload, 'brand_registration_sid'),
            'messagingServiceSid' => Values::array_get($payload, 'messaging_service_sid'),
            'description' => Values::array_get($payload, 'description'),
            'messageSamples' => Values::array_get($payload, 'message_samples'),
            'usAppToPersonUsecase' => Values::array_get($payload, 'us_app_to_person_usecase'),
            'hasEmbeddedLinks' => Values::array_get($payload, 'has_embedded_links'),
            'hasEmbeddedPhone' => Values::array_get($payload, 'has_embedded_phone'),
            'subscriberOptIn' => Values::array_get($payload, 'subscriber_opt_in'),
            'ageGated' => Values::array_get($payload, 'age_gated'),
            'directLending' => Values::array_get($payload, 'direct_lending'),
            'campaignStatus' => Values::array_get($payload, 'campaign_status'),
            'campaignId' => Values::array_get($payload, 'campaign_id'),
            'isExternallyRegistered' => Values::array_get($payload, 'is_externally_registered'),
            'rateLimits' => Values::array_get($payload, 'rate_limits'),
            'messageFlow' => Values::array_get($payload, 'message_flow'),
            'optInMessage' => Values::array_get($payload, 'opt_in_message'),
            'optOutMessage' => Values::array_get($payload, 'opt_out_message'),
            'helpMessage' => Values::array_get($payload, 'help_message'),
            'optInKeywords' => Values::array_get($payload, 'opt_in_keywords'),
            'optOutKeywords' => Values::array_get($payload, 'opt_out_keywords'),
            'helpKeywords' => Values::array_get($payload, 'help_keywords'),
            'dateCreated' => Deserialize::dateTime(Values::array_get($payload, 'date_created')),
            'dateUpdated' => Deserialize::dateTime(Values::array_get($payload, 'date_updated')),
            'url' => Values::array_get($payload, 'url'),
            'mock' => Values::array_get($payload, 'mock'),
            'errors' => Values::array_get($payload, 'errors'),
        ];

        $this->solution = ['messagingServiceSid' => $messagingServiceSid, 'sid' => $sid ?: $this->properties['sid'], ];
    }

    /**
     * Generate an instance context for the instance, the context is capable of
     * performing various actions.  All instance actions are proxied to the context
     *
     * @return UsAppToPersonContext Context for this UsAppToPersonInstance
     */
    protected function proxy(): UsAppToPersonContext
    {
        if (!$this->context) {
            $this->context = new UsAppToPersonContext(
                $this->version,
                $this->solution['messagingServiceSid'],
                $this->solution['sid']
            );
        }

        return $this->context;
    }

    /**
     * Delete the UsAppToPersonInstance
     *
     * @return bool True if delete succeeds, false otherwise
     * @throws TwilioException When an HTTP error occurs.
     */
    public function delete(): bool
    {

        return $this->proxy()->delete();
    }

    /**
     * Fetch the UsAppToPersonInstance
     *
     * @return UsAppToPersonInstance Fetched UsAppToPersonInstance
     * @throws TwilioException When an HTTP error occurs.
     */
    public function fetch(): UsAppToPersonInstance
    {

        return $this->proxy()->fetch();
    }

    /**
     * Update the UsAppToPersonInstance
     *
     * @param bool $hasEmbeddedLinks Indicates that this SMS campaign will send messages that contain links.
     * @param bool $hasEmbeddedPhone Indicates that this SMS campaign will send messages that contain phone numbers.
     * @param string[] $messageSamples An array of sample message strings, min two and max five. Min length for each sample: 20 chars. Max length for each sample: 1024 chars.
     * @param string $messageFlow Required for all Campaigns. Details around how a consumer opts-in to their campaign, therefore giving consent to receive their messages. If multiple opt-in methods can be used for the same campaign, they must all be listed. 40 character minimum. 2048 character maximum.
     * @param string $description A short description of what this SMS campaign does. Min length: 40 characters. Max length: 4096 characters.
     * @param bool $ageGated A boolean that specifies whether campaign requires age gate for federally legal content.
     * @param bool $directLending A boolean that specifies whether campaign allows direct lending or not.
     * @return UsAppToPersonInstance Updated UsAppToPersonInstance
     * @throws TwilioException When an HTTP error occurs.
     */
    public function update(bool $hasEmbeddedLinks, bool $hasEmbeddedPhone, array $messageSamples, string $messageFlow, string $description, bool $ageGated, bool $directLending): UsAppToPersonInstance
    {

        return $this->proxy()->update($hasEmbeddedLinks, $hasEmbeddedPhone, $messageSamples, $messageFlow, $description, $ageGated, $directLending);
    }

    /**
     * Magic getter to access properties
     *
     * @param string $name Property to access
     * @return mixed The requested property
     * @throws TwilioException For unknown properties
     */
    public function __get(string $name)
    {
        if (\array_key_exists($name, $this->properties)) {
            return $this->properties[$name];
        }

        if (\property_exists($this, '_' . $name)) {
            $method = 'get' . \ucfirst($name);
            return $this->$method();
        }

        throw new TwilioException('Unknown property: ' . $name);
    }

    /**
     * Provide a friendly representation
     *
     * @return string Machine friendly representation
     */
    public function __toString(): string
    {
        $context = [];
        foreach ($this->solution as $key => $value) {
            $context[] = "$key=$value";
        }
        return '[Twilio.Messaging.V1.UsAppToPersonInstance ' . \implode(' ', $context) . ']';
    }
}

