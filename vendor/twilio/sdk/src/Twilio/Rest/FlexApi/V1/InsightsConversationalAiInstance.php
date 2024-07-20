<?php

/**
 * This code was generated by
 * ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
 *  |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
 *  |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
 *
 * Twilio - Flex
 * This is the public Twilio REST API.
 *
 * NOTE: This class is auto generated by OpenAPI Generator.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


namespace Twilio\Rest\FlexApi\V1;

use Twilio\Exceptions\TwilioException;
use Twilio\InstanceResource;
use Twilio\Options;
use Twilio\Values;
use Twilio\Version;
use Twilio\Deserialize;


/**
 * @property string|null $instanceSid
 * @property string|null $reportId
 * @property string $granularity
 * @property \DateTime|null $periodStart
 * @property \DateTime|null $periodEnd
 * @property \DateTime|null $updated
 * @property int|null $totalPages
 * @property int|null $page
 * @property array[]|null $rows
 * @property string|null $url
 */
class InsightsConversationalAiInstance extends InstanceResource
{
    /**
     * Initialize the InsightsConversationalAiInstance
     *
     * @param Version $version Version that contains the resource
     * @param mixed[] $payload The response payload
     * @param string $instanceSid Sid of Flex Service Instance
     */
    public function __construct(Version $version, array $payload, string $instanceSid = null)
    {
        parent::__construct($version);

        // Marshaled Properties
        $this->properties = [
            'instanceSid' => Values::array_get($payload, 'instance_sid'),
            'reportId' => Values::array_get($payload, 'report_id'),
            'granularity' => Values::array_get($payload, 'granularity'),
            'periodStart' => Deserialize::dateTime(Values::array_get($payload, 'period_start')),
            'periodEnd' => Deserialize::dateTime(Values::array_get($payload, 'period_end')),
            'updated' => Deserialize::dateTime(Values::array_get($payload, 'updated')),
            'totalPages' => Values::array_get($payload, 'total_pages'),
            'page' => Values::array_get($payload, 'page'),
            'rows' => Values::array_get($payload, 'rows'),
            'url' => Values::array_get($payload, 'url'),
        ];

        $this->solution = ['instanceSid' => $instanceSid ?: $this->properties['instanceSid'], ];
    }

    /**
     * Generate an instance context for the instance, the context is capable of
     * performing various actions.  All instance actions are proxied to the context
     *
     * @return InsightsConversationalAiContext Context for this InsightsConversationalAiInstance
     */
    protected function proxy(): InsightsConversationalAiContext
    {
        if (!$this->context) {
            $this->context = new InsightsConversationalAiContext(
                $this->version,
                $this->solution['instanceSid']
            );
        }

        return $this->context;
    }

    /**
     * Fetch the InsightsConversationalAiInstance
     *
     * @param array|Options $options Optional Arguments
     * @return InsightsConversationalAiInstance Fetched InsightsConversationalAiInstance
     * @throws TwilioException When an HTTP error occurs.
     */
    public function fetch(array $options = []): InsightsConversationalAiInstance
    {

        return $this->proxy()->fetch($options);
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
        return '[Twilio.FlexApi.V1.InsightsConversationalAiInstance ' . \implode(' ', $context) . ']';
    }
}

